; Schlumberger Public

(define (problem peeling)(:domain emprise)

(:objects
    p - peeler
    ve - vegetable
    sj - statjaw
    mj - movjaw
    w - wall
    c - clamp
)

(:init
    (ontable p)
    (ontable ve)

    (handempty)

    (locked c)
    (not(between ve mj sj))
    (not(farfrom mj sj))

    (not(toppeeled ve))
    (not(partpeeled ve))
    (not(peeled ve))
)

(:goal (and
    (ontable ve)

    (not(partpeeled ve))
    (peeled ve)
))
)