; Schlumberger Public

(define (problem peeling)(:domain emprise)

(:objects
    p - peeler
    ve - vegetable
    vi - vice
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
    (not(between ve vi))
    (not(farfrom vi))

    (not(partpeeled ve))
    (not(peeled ve))
)

(:goal (and
    (ontable ve)

    (not(partpeeled ve))
    (peeled ve)
))
)