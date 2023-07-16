%{(Post "What is a Riemann Surface?" "July 2023")}%
Riemann surfaces are considered to be some of the most important
concepts in modern mathematics, but no one can really explain what
they even are. The advanced approaches which usually rely on topology 
are beyond my current level of understanding and elementary approaches
treat Riemann Surfaces as fairy dust. "Look here's this magical thing 
with a fancy name" but no "here's what Riemann surfaces help you 
discover". This post seeks to be an elementary, yet motivated, 
introduction to Riemann surfaces.  I hope to actually understand what 
they are when I'm done writing this.

This post assumes the basic properties of the complex numbers such
as the geometric interpretation of the complex numbers, the roots of
unity, continuous functions, continuous curves, and the fundamental 
theorem of algebra.

1. Multivalued functions
2. Surfaces and their properties
3. The function $\sqrt z$
4. The Riemann surface of $\sqrt z$
5. Riemann surfaces of other functions
6. Monodromy
____

## Multivalued functions

A function $f:A\to B$ is commonly defined to be a rule that associates 
an element of its domain $A$ to an element of its range $B$ in such a 
way that if $x = y,$ then $f(x) = f(y).$ In other words, for any 
$x \in A,$ there is only one value $y \in B$ such that $f(x) = y.$ The
intuition behind this choice of definition is that, when a function 
encounters two possible outputs for the same input, it gets stuck. For
example The function $C(x) = 5(x - 32)/9$ that converts Farenheit to 
Celsius is such a function. It would be very strange if the same 
Farenheit temprature was converted to two different Celsius ones.

However, there are certain areas where it makes sense for a function to 
have multiple valid outputs. One such area is in solving equations. For
instance, the equation $x^2 = 1$ has two solutions: $1,$ and $-1.$ So
if we define $f(y) = \sqrt y$ to be the solution of the equation 
$x^2 = y,$ then we have a function that can have two values at once:
$f(1) = -1$ and $f(1) = 1.$ We call these kinds of functions *multivalued,*
and denote the output as a set: $f(1) = \\{ 1, -1 \\}.$

These are some other examples of multivalued functions.

1. Let $\arcsin x$ be the function such that $x = \arcsin y$ is a 
solution to the equation $\sin x = y.$ So 
$\arcsin(0) = \\{k\pi\,|\,k \in \mathbb{N}\\}.$ Similarly for $\arccos x,$
and $\arctan x.$

2. Let $\arg z$ be a function such that $\theta = \arg z$ is a solution
to the equation $z = |z|(\cos\theta + i\sin\theta).$

3. Suppose that in a knowledge representation system there is a binary
predicate $\text{Parent}(x,y)$ which states that $x$ is a child of $y.$
Then let $y = \text{Children}(x)$ be the solution to the logical equation 
$\text{Parent}(y,x).$ Therefore
$$
\text{Children}(\text{Charlotte Ebell}) = 
\\{ \text{Ida}, \text{Helene}, \text{Clara}, \text{Wilhelm}, \text{Marie}, \text{Georg} \\}.
$$

4. Let $f(a, b, c) = (-b \pm \sqrt{b^2 - 4ac})/2a$ be the solution to the
equation $ax^2 + bx + c = 0.$ Therefore
$$f(1, -1, -1) = \\{(1+\sqrt 5)/2, (1-\sqrt 5)/2\\}.$$

Example (4) exposes a problem with multivalued functions. When doing
arithmetic with the multivalued function $\sqrt z,$ it is not clear
which one of the values we should use. In the quadratic formula this 
problem is fixed by using $\pm$ as a way to indicate that there are
two possible solutions. In other cases we only use the *principal value*
of the function, which is a way of choosing a single output based on
some conventional rule. In $\sqrt x$ this is usually the positive value
when the domain is $\mathbb{R}$ and the value on the right side of the
plane when the domain is $\mathbb{C}.$

One of the ways to choose one of the output values of a multivalued function
$f(z)$ is by using continuity. In [1] this is called the *variation* of $f(z).$
An example of this is the 

## Sources

[1] Alekseev, V. B., and Vladimir Igorevich Arnol’d. *Abel’s Theorem in Problems and Solutions Based on the Lectures of Professor V.I. Arnold*. Kluwer Academic Publishers, 2010. 
