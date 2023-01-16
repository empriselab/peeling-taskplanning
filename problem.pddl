(define (problem peeling)(:domain emprise)

(:objects
    food_peeler - peeler
    food_item - vegetable
    stationary_jaw - statjaw
    moving_jaw - movjaw
    jaw_clamp - clamp
)

(:init
    (ontable food_peeler)
    (ontable food_item)

    (handempty)
    (not(holding food_item))
    (not(holding food_peeler))

    (locked jaw_clamp)
    (not(between food_item moving_jaw stationary_jaw))
    (not(toofar moving_jaw stationary_jaw))
    (not(rightdistance moving_jaw stationary_jaw))
    (tooclose moving_jaw stationary_jaw)

    (not(toppeeled food_item))
    (not(peeled food_item))
)


(:goal (and
    (ontable food_item)

    (peeled food_item)
))
)