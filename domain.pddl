;; This is the domain of a world where a robot arm picks up a given object, 
;; peels it using a designated commersial peeler and puts it back down.

;Header and description

(define (domain domain_name)

;remove requirements that are not needed
(:requirements          :strips                 :fluents 
 :durative-actions      :timed-initial-literals :typing 
 :conditional-effects   :negative-preconditions 
 :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    movjaw statjaw - cuttingboard ;assumes board is apart of table
    wall clamp - movjaw ;two parts to moving jaw: clamp and wall
    peeler vegetable - object;assuming fruits are vegetables too
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (ontable ?a - object);peeler/vegetable is on table
    ; robot arm related
    (holding ?a - object);gripper is holding object
    (handempty);gripper is not holding anything
    ; cuttingboard related
    (locked ?a - clamp);clamp is locked
    (touching ?a - vegetable ?b - cuttingboard);vegetable is touching moving and stationary jaw
    (between ?a - vegetable ?b - cuttingboard) ;vegetable is between two clamps
    ; peeling
    (partpeeled ?a - vegetable);vegetable is partially peeled
    (peeled ?a - vegetable);vegetable is fully peeled
    ; peeler related
)

;define actions here
(:action pickup ; to pick up from table
    :parameters (?a - object)
    :precondition (and 
        (handempty)
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
    )
    :effect (and 
        (ontable ?a)
        (not(holding ?a))
        (handempty)
        ()
    )
)
(:action movetoward ;to move toward the jaws (important for vegetable)
    :parameters ()
    :precondition (and )
    :effect (and )
)
(:action moveaway ;to move away from the jaws (important for vegetable)
    :parameters ()
    :precondition (and )
    :effect (and )
)

)