; In this problem, only the outer half of the food item is peeled.
; The food item is still clamped between the two jaws, and the gripper is empty.
; The goal is to peel the entire food item.
(define (problem peeling)(:domain emprise)

(:objects
    food_peeler - peeler
    food_item - food
    stationary_jaw - statjaw
    moving_jaw - movjaw
    vice_handle - handle
)

(:init
    (OnTable food_peeler)
    (OnTable food_item)

    (HandEmpty)
    (not(Holding food_item))
    (not(Holding food_peeler))

    (islocked vice_handle)
    (IsBetween food_item moving_jaw stationary_jaw)
    (not(JawsAreTooFar moving_jaw stationary_jaw))
    (JawsAreRightDistance moving_jaw stationary_jaw)
    (not(JawsAreTooClose moving_jaw stationary_jaw))

    (TopPeeled food_item)
    (OuterHalfPeeled food_item)
    (not(InnerHalfPeeled food_item))
)


(:goal (and
    (OnTable food_item)

    (OuterHalfPeeled food_item)
    (InnerHalfPeeled food_item)
    (TopPeeled food_item)
))
)