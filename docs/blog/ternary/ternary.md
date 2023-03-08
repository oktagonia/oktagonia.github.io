%{(Post "Three-Valued Logic in the λ-Calculus"
   "January 2023")}%

We define our three logical values in a similar fashion to the Church-encoding
of booleans:

* $\\mathbf{T} = \\lambda xyz.x$
* $\\mathbf{F} = \\lambda xyz.y$
* $\\mathbf{X} = \\lambda xyz.z$

And these are some common logical connectives:

Connective              | Implementation
----------------------- | --------------------------------
Negation                | $\\neg x = x\\mathbf{F}\\mathbf{T}\\mathbf{X}$
Conjunction             | $x\\land y = xyx(y\\mathbf{X}\\mathbf{F}\\mathbf{X})$
Disjunction             | $x\\lor y = x\\mathbf{T}y(y\\mathbf{T}\\mathbf{X}\\mathbf{X})$
Łukasiewicz implication | $x \\to y = xy\\mathbf{T}(y\\mathbf{T}\\mathbf{X}\\mathbf{T})$
Kleene implication      | $x \\to y = \\neg x \\lor y$
