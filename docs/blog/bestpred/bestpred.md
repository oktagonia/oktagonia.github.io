%{(Post "Finding the best regressor using the calculus of variations"
 "January 2025")}%

Suppose we have two random variables $(X,Y)$ with a joint distribution
given by $p.$ We wish to find the function $g$ of $X$ minimizes the expected
squared loss
$$
E(Y - g(X))^2 = \int (y - g(x))^2 p(x, y)\,dxdy.
$$
Most of you probably now that the answer is the conditional expectation
$$
g(x) = E(Y | X = x) = 
\frac{\displaystyle\int y p(x, y)\, dxdy}{\displaystyle\int p(x, y)\, dy}
$$
but the usual proof is, though nice, general and probabilistic, quite 
opaque.  You start by adding and subtracting the conditional expectation 
from the inside of the expected error
$$\begin{aligned}
E(Y - g(X))^2 
&= E(Y - E(Y|X) + E(Y|X) - g(X))^2 \\\\
&= E(Y - E(Y|X))^2 + E(E(Y|X) - g(X))^2 \\\\
&\geq E(Y - E(Y|X))^2
\end{aligned}$$
It almost feels like you're supposed to know the answer before coming up
with it! I find that unsatisfying. A solution that leads you
to the right answer, albeit with less generality, can be obtained by using 
the calculus of variations.

We wish to find the function $g$ that minimizes the integral
$$
J(g) = E(Y - g(X))^2 = \int (y - g(x)^2 p(x, y)\,dxdy.
$$
This is a problem for the calculus of variations! Lets try to find the
first variation of this functional.
$$\begin{aligned}
J(g + \eta) 
&= \int (y - g(x) - \eta(x))^2 p(x,y)\,dxdy \\\\
&= \int (y - g(x))^2 p(x,y)\,dxdy \\\\
&\quad\quad- 2\int (y - g(x))\eta(x) p(x, y)\,dxdy \\\\
&\quad\quad\quad\quad+ \int \eta(x)^2 p(x, y)\,dxdy
\end{aligned}$$
It is evident that
$$
J(g + \eta) - J(g) 
= -2\int (y - g(x))\eta(x) p(x, y)\,dxdy + o(\eta^2)
$$
which means that the first variation is
$$
\delta J_g(\eta) = -2\int (y - g(x))\eta(x) p(x, y)\,dxdy
$$
So we must try and find $g$ such that $\delta J_g(\eta) = 0$ for all
$\eta$. Notice that by Fubini's theorem it follows that
$$
\delta J_g(\eta) = \int\left(\int (y - g(x)p(x,y)\,dy\right)\eta(x)\,dx=0
$$
for all $\eta$. The fundamental lemma of the calculus of variations then
implies that
$$
\int (y - g(x))p(x, y)\,dy = 0
$$
and this means that
$$
\int yp(x, y)\,dy = g(x) \int p(x, y)\,dy
$$
which is precisely what we wanted to show.

What about other measures of loss? Another common one is the
expected absolute loss
$$
J(g) = E|Y - g(X)| = \int |y - g(x)|p(x, y)\,dxdy
$$
Just like before we begin by finding the first variation
$$\begin{aligned}
J(g + \eta) - J(g)
&= \int\left(|y - g(x) - \eta(x)| - |y - g(x)|\right)p(x,y)\,dxdy \\\\
&= \int\left(\frac{\partial|y - g(x) - \eta(x)|}{\partial \eta(x)}\eta(x) + o(\eta(x)^2)\right)p(x,y)\,dxdy \\\\
&= \int\operatorname{sgn}(y - g(x))\eta(x)p(x,y)\,dxdy + o(\eta^2)
\end{aligned}$$
which means that
$$
\delta J_g(\eta) = \int\operatorname{sgn}(y - g(x))\eta(x)p(x,y)\,dxdy.
$$
Just like before, we apply Fubini and the fundamental lemma to conclude
that
$$
\int\operatorname{sgn}(y - g(x))p(x, y)\,dy = 0
$$
Breaking up this integral into two results in
$$
\int_{y>g(x)} p(x,y)\,dy-\int_{y \leq g(x)}p(x, y)\,dy = 0
$$
that is, $g(x)$ is the number such that the distribution of $Y|X=x$ has the
same mass to the left of $g(x)$ as it has to the right of $g(x)$. This
number is called the *conditional median* of $Y$ at $X = x$.
