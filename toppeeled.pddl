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
    (not(IsBetween food_item moving_jaw stationary_jaw))
    (not(JawsAreTooFar moving_jaw stationary_jaw))
    (not(JawsAreRightDistance moving_jaw stationary_jaw))
    (JawsAreTooClose moving_jaw stationary_jaw)

    (OuterHalfPeeled food_item)
    (TopPeeled food_item)
    (not(FullyPeeled food_item))
)


(:goal (and
    (OnTable food_item)

    (FullyPeeled food_item)
))
)