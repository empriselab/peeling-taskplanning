;; This is the domain of a world where a robot arm picks up a given object, 
;; peels it using a designated commersial peeler and puts it back down.

;Header and description

(define (domain emprise)

;remove requirements that are not needed
(:requirements 
    :strips :typing :derived-predicates)
;  :durative-actions      :timed-initial-literals :fluents 
;  :conditional-effects   :negative-preconditions 
;  :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    movjaw statjaw - vice ;assumes board is apart of table
    wall clamp - movjaw ;two parts to moving jaw: clamp and wall
    peeler vegetable ; assuming fruits are vegetables too
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
    (between ?a - vegetable ?b - vice) ;vegetable is between two clamps
    (farfrom ?a - vice) ;the two jaws are far from eachother
    ; peeling
    (toppeeled ?a - vegetable);vegetable is peeled on top (partially peeled)
    (partpeeled ?a - vegetable);vegetable is partially peeled
    (peeled ?a - vegetable);vegetable is fully peeled (not peeled implies partpeeled or not peeled at all)
    ; peeler related
)

(:derived (touching ?a - vegetable ?b - vice) ;vegetable is touching moving and stationary jaw
    (and
        (between ?a ?b)
        (not(farfrom ?b))
    )
)
(:derived (handempty)
    (not(holding ?a))
)
(:derived (not(holding ?a - object))
    (handempty)
)

;define actions here
(:action pickup ; to pick up from table
    :parameters (?a - object)
    :precondition (and 
        (handempty)
        (not(holding ?a))
        (ontable ?a)
    )
    :effect (and
        (holding ?a)
        ;(not (handempty))
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
        ;(handempty)
    )
)
(:action movetoward ;to move toward the jaws (important for vegetable)
    :parameters (?a - vegetable ?b - vice)
    :precondition (and 
        (holding ?a)
        (not(handempty))
        (not(between ?a ?b))
    )
    :effect (between ?a ?b)
)
(:action moveaway ;to move away from the jaws (important for vegetable)
    :parameters (?a - vegetable ?b - vice)
    :precondition (and 
        (holding ?a)
        (not(handempty))
        (between ?a ?b)
    )
    :effect (not(between ?a ?b))
)
(:action lock ;to lock the clamp
    :parameters (?a - clamp)
    :precondition (and
        (handempty)
        (not(locked ?a))
    )
    :effect (locked ?a)
)
(:action unlock ;to unlock the clamp
    :parameters (?a - clamp)
    :precondition (and 
        (handempty)
        (locked ?a)
    )
    :effect (not (locked ?a))
)
(:action slidein ;to slide in the moving jaw
    :parameters (?a - vice ?b - vegetable)
    :precondition (and
        (not (locked ?a))
        (farfrom ?a)
        (between ?b ?a)
    )
    :effect (and
        (not(farfrom ?a))
        (touching ?b ?a)
    )
)
(:action slideout ;to slide out the moving jaw
    :parameters (?a - vice ?b - vegetable)
    :precondition (and 
        (not (locked ?a))
        (not (farfrom ?a))
    )
    :effect (and
        (farfrom ?a)
        (not(touching ?b ?a))
        )
)
(:action partpeeling ;making progress, partially peeling the vegetable
    :parameters (?a - vegetable ?b - peeler ?c - vice ?d - clamp)
    :precondition (and 
        (not(peeled ?a))
        (not(toppeeled ?a))
        (holding ?b)
        (touching ?a ?c)
        (locked ?d)
    )
    :effect (and
        (toppeeled ?a)
        (partpeeled ?a)
    )
)
(:action comppeeling ;completely peeling the vegetable
    :parameters (?a - vegetable ?b - peeler ?c - vice ?d - clamp)
    :precondition (and 
        (not(peeled ?a))
        (not(toppeeled ?a))
        (partpeeled ?a)
        (holding ?b)
        (touching ?a ?c)
        (locked ?d)
    )
    :effect (and 
        (peeled ?a)
    )
)
(:action rotate
    :parameters (?a - vegetable ?b - clamp ?c - vice)
    :precondition (and 
        (not (locked ?b))
        (toppeeled ?a)
        (not(handempty))
    )
    :effect (and 
        (not (toppeeled ?a))
        (farfrom ?v) ; assuming that I have to readjust vice everytime I rotate
    )
)


; (:axiom
;     :vars (?a - vice ?b - vegetable)
;     :context (and
;         (between ?b ?a)
;         (not(farfrom ?a))
;     )
;     :implies (touching ?b ?a)
; )
; (:axiom
;     :vars (?a - vice ?b - vegetable)
;     :context (and
;         (between ?b ?a)
;         (farfrom ?a)
;     )
;     :implies (not(touching ?b ?a))
; )
)