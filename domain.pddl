;; This is the domain of a world where a robot arm picks up a given object, 
;; peels it using a designated commersial peeler and puts it back down.

(define (domain emprise)

(:requirements 
    :strips :typing :negative-preconditions :disjunctive-preconditions)

(:types
    handle movjaw statjaw - object;assumes board is apart of table
    peeler food - pickupable
)

(:predicates
    (OnTable ?a - object);peeler/food is on table
    (Holding ?a - object);gripper is Holding object
    (HandEmpty);gripper is not Holding anything
    
    ; cuttingboard related
    (IsLocked ?a - handle);handle is locked
    (IsBetween ?a - food ?b - movjaw ?c - statjaw) ;food is between two jaws (can be on table or not)
    (JawsAreTooFar ?a - movjaw ?b - statjaw) ;the two jaws are too far from eachother
    (JawsAreTooClose ?a - movjaw ?b - statjaw) ; the jaws are too close to eachother
    (JawsAreRightDistance ?a - movjaw ?b - statjaw) ; the distance IsBetween the jaws is the width of food
    
    ; peeling
    (TopPeeled ?a - food);food is peeled on top ignoring the part held between the jaws
    (OuterHalfPeeled ?a - food) ;the part of the food NOT clamped by the jaws is peeled
    (InnerHalfPeeled ?a - food);the part of the food clamped by the jaws is peeled
    ; food is fully peeled if the outer and inner half are peeled
    ;(FullyPeeled ?a - food);food is fully peeled;
)

(:action PickUp 
    ; to pick up an object from table
    :parameters (?a - pickupable)
    :precondition (and 
        (HandEmpty)
        (not(Holding ?a))
        (OnTable ?a)
    )
    :effect (and
        (Holding ?a)
        (not (HandEmpty))
        (not (OnTable ?a))
    ) 
)
(:action PutDown
    ; to put the object down onto the table
    :parameters (?a - pickupable)
    :precondition (and 
        (not(HandEmpty))
        (Holding ?a)
        (not(OnTable ?a))
    )
    :effect (and 
        (OnTable ?a)
        (not(Holding ?a))
        (HandEmpty)
    )
)
(:action MoveToJaws 
    ; to move the food item toward the jaws so that it is 
    ; between the stationary and moving jaws
    :parameters (?a - food ?b - movjaw ?c - statjaw)
    :precondition (and 
        (Holding ?a)
        (not(OnTable ?a))
        (not(HandEmpty))
        (not(IsBetween ?a ?b ?c))
        (not(JawsAreTooClose ?b ?c))
    )
    :effect (IsBetween ?a ?b ?c)
)
(:action MoveFromJaws 
    ; to move the food item away from the jaws
    :parameters (?a - food ?b - movjaw ?c - statjaw)
    :precondition (and 
        (Holding ?a)
        (not(HandEmpty))
        (IsBetween ?a ?b ?c)
    )
    :effect (not(IsBetween ?a ?b ?c))
)
(:action Lock 
    ;to lock the vice handle
    :parameters (?a - handle)
    :precondition (and
        (HandEmpty)
        (not(IsLocked ?a))
    )
    :effect (IsLocked ?a)
)
(:action Unlock 
    ;to unlock the vice handle
    :parameters (?a - handle)
    :precondition (and 
        (HandEmpty)
        (IsLocked ?a)
    )
    :effect (not (IsLocked ?a))
)
(:action SlideInMovingJaw 
    ; to slide in the moving jaw so that the distance between the jaws
    ; is just right to secure the food item
    :parameters (?a - handle ?b - food ?c - movjaw ?d - statjaw)
    :precondition (and
        (not (IsLocked ?a))
        
        ;(JawsAreTooFar ?c ?d)
        (not (JawsAreTooClose ?c ?d))
        (not (JawsAreRightDistance ?c ?d))

        (IsBetween ?b ?c ?d)
    )
    :effect (and
        (not(JawsAreTooFar ?c ?d))
        (not (JawsAreTooClose ?c ?d))
        (JawsAreRightDistance ?c ?d)
    )
)
(:action SlideOutMovingJaw 
    ; to slide out the moving jaw so that the food item can be moved
    :parameters (?a - handle ?b - food ?c - movjaw ?d - statjaw)
    :precondition (and 
        (not(IsLocked ?a))
        
        (not (JawsAreTooFar ?c ?d)) ; too close 
        (JawsAreTooClose ?c ?d)
        (not (JawsAreRightDistance ?c ?d))
    )
    :effect (and
        (JawsAreTooFar ?c ?d)
        (not(JawsAreTooClose ?c ?d))
        (not(JawsAreRightDistance ?c ?d))
        )
)
(:action Peel 
    ; to peel the food item (non-deterministic)
    ; depending on the global state, the effect can either be that the
    ; 1) outer half of the food is fully peeled
    ; 2) outer half of the food is not fully peeled
    :parameters (?a - food ?b - peeler ?c - movjaw ?d - statjaw ?e - handle)
    :precondition (and 
        (not(OuterHalfPeeled ?a))
        (not(TopPeeled ?a))
        (Holding ?b)
        (IsLocked ?e)
        (IsBetween ?a ?c ?d)
        
        (not(JawsAreTooFar ?c ?d))
        (not(JawsAreTooClose ?c ?d))
        (JawsAreRightDistance ?c ?d)
        )
    :effect (and
        (TopPeeled ?a)
        (oneof (OuterHalfPeeled ?a) (not(OuterHalfPeeled ?a)))
        )
)
(:action Rotate 
    ; rotate the food item (non-deterministic)
    ; depending on the global state, the effect can either be that the
    ; 1) the jaws are too far apart (must adjust moving jaw position)
    ; 2) the jaws are right distance apart (proceeds to next step)
    :parameters (?a - food ?b - handle ?c - movjaw ?d - statjaw)
    :precondition (and 
        (not (IsLocked ?b))
        (HandEmpty)

        (TopPeeled ?a)
        (not(OuterHalfPeeled ?a))

        (not(JawsAreTooClose ?c ?d))
        (IsBetween ?a ?c ?d)
        )
    :effect (and 
        (not (TopPeeled ?a))
        (oneof
            (and     (JawsAreTooFar ?c ?d)(not(JawsAreRightDistance ?c ?d)))
            (and (not(JawsAreTooFar ?c ?d))   (JawsAreRightDistance ?c ?d))
        )
        )
)
(:action Flip
    ; flip the food item (non-deterministic)
    ; state of the jaws can be:
    ; 1) the jaws are too far apart (must adjust moving jaw position)
    ; 2) the jaws are right distance apart (proceeds to next step)
    :parameters (?a - food ?b - handle ?c - movjaw ?d - statjaw)
    :precondition (and 
        (not (IsLocked ?b))
        (HandEmpty)

        (TopPeeled ?a)
        (OuterHalfPeeled ?a)
        (not(InnerHalfPeeled ?a))

        (not(JawsAreTooClose ?c ?d))
        )
    :effect (and 
        (not(TopPeeled ?a))
        (not(OuterHalfPeeled ?a))
        (InnerHalfPeeled ?a)
        (oneof
            (and     (JawsAreTooFar ?c ?d)(not(JawsAreRightDistance ?c ?d)))
            (and (not(JawsAreTooFar ?c ?d))   (JawsAreRightDistance ?c ?d))
        )
        )
)

)