; Schlumberger Public

(define (problem peeling)(:domain emprise)

(:objects
    peeler
    food_item - vegetable
    stationary_jaw - statjaw
    moving_jaw - movjaw
    wall
    clamp
)

(:init
    (ontable peeler)
    (ontable food_item)

    (handempty)

    (locked clamp)
    (not(between food_item moving_jaw stationary_jaw))
    (not(farfrom moving_jaw stationary_jaw))

    (not(toppeeled food_item))
    (not(partpeeled food_item))
    (not(peeled food_item))
)

(:goal (and
    (ontable food_item)

    (not(partpeeled food_item))
    (peeled food_item)
))
)