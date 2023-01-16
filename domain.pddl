;; This is the domain of a world where a robot arm picks up a given object, 
;; peels it using a designated commersial peeler and puts it back down.

(define (domain emprise)


(:requirements 
    :strips :typing :negative-preconditions :disjunctive-preconditions)

(:types
    clamp movjaw statjaw - object ;assumes board is apart of table
    peeler vegetable - object ; assuming fruits are vegetables too
)


(:predicates
    (ontable ?a - object);peeler/vegetable is on table
    ; robot arm related
    (holding ?a - object);gripper is holding object
    (handempty);gripper is not holding anything
    ; cuttingboard related
    (locked ?a - handle);handle is locked
    (between ?a - vegetable ?b - movjaw ?c - statjaw) ;vegetable is between two jaws (can be ontable or not)
    (toofar ?a - movjaw ?b - statjaw) ;the two jaws are too far from eachother
    (tooclose ?a - movjaw ?b - statjaw) ; the jaws are too close to eachother
    (rightdistance ?a - movjaw ?b - statjaw) ; the distance between the jaws is the width of vegetable
    ; peeling
    (toppeeled ?a - vegetable);vegetable is peeled on top (partially peeled)
    (peeled ?a - vegetable);vegetable is fully peeled (not peeled implies partpeeled or not peeled at all)
)


(:action pickup ; to pick up from table
    :parameters (?a - object)
    :precondition (and 
        (handempty)
        (not(holding ?a))
        (ontable ?a)
    )
    :effect (and
        (holding ?a)
        (not (handempty))
        (not (ontable ?a))
    ) 
)
(:action putdown
    :parameters (?a - object)
    :precondition (and 
        (holding ?a)
        (not(ontable ?a))
    )
    :effect (and 
        (ontable ?a)
        (not(holding ?a))
        (handempty)
    )
)
(:action movetoward ;to move toward the jaws (important for vegetable)
    :parameters (?a - vegetable ?b - movjaw ?c - statjaw)
    :precondition (and 
        (holding ?a)
        (not(ontable ?a))
        (not(handempty))
        (not(between ?a ?b ?c))
        (not(tooclose ?b ?c))
        (or(rightdistance ?b ?c)(toofar ?b ?c))
    )
    :effect (between ?a ?b ?c)
)
(:action moveaway ;to move away from the jaws (important for vegetable)
    :parameters (?a - vegetable ?b - movjaw ?c - statjaw)
    :precondition (and 
        (holding ?a)
        (not(handempty))
        (between ?a ?b ?c)
    )
    :effect (not(between ?a ?b ?c))
)
(:action lock ;to lock the handle
    :parameters (?a - handle)
    :precondition (and
        (handempty)
        (not(locked ?a))
    )
    :effect (locked ?a)
)
(:action unlock ;to unlock the handle
    :parameters (?a - handle)
    :precondition (and 
        (handempty)
        (locked ?a)
    )
    :effect (not (locked ?a))
)
(:action slidein ;to slide in the moving jaw
    :parameters (?a - handle ?b - vegetable ?c - movjaw ?d - statjaw)
    :precondition (and
        (not (locked ?a))
        
        (toofar ?c ?d)
        (not (tooclose ?c ?d))
        (not (rightdistance ?c ?d))

        (between ?b ?c ?d)
    )
    :effect (and
        (not(toofar ?c ?d))
        (rightdistance ?c ?d)
    )
)
(:action slideout ;to slide out the moving jaw
    :parameters (?a - handle ?b - vegetable ?c - movjaw ?d - statjaw)
    :precondition (and 
        (not(locked ?a))
        
        (not(toofar ?c ?d)) ; too close or rightdistance
        (or(tooclose ?c ?d) (rightdistance ?c ?d))
    )
    :effect (and
        (toofar ?c ?d)
        (not(tooclose ?c ?d))
        (not(rightdistance ?c ?d))
        )
)
(:action peeling ;making progress, partially peeling the vegetable
    :parameters (?a - vegetable ?b - peeler ?c - movjaw ?d - statjaw ?e - handle)
    :precondition (and 
        (not(peeled ?a))
        (not(toppeeled ?a))
        (holding ?b)
        (locked ?e)
        (between ?a ?c ?d)
        
        (not(toofar ?c ?d))
        (not(tooclose ?c ?d))
        (rightdistance ?c ?d)
        )
    :effect (and
        (toppeeled ?a)
        (oneof (not(peeled ?a)) (peeled ?a))
    )
)
(:action rotate
    :parameters (?a - vegetable ?b - handle ?c - movjaw ?d - statjaw)
    :precondition (and 
        (not (locked ?b))
        (toppeeled ?a)
        (handempty)

        (not(tooclose ?c ?d))
        (or(rightdistance ?c ?d) (toofar ?c ?d))
    )
    :effect (and 
        (not (toppeeled ?a))
        (toofar ?c ?d) ; assuming that I have to readjust vice everytime I rotate
        (not(rightdistance ?c ?d))
    )
)

)