%{(Post "Analytical Optics" "July 2023")}%

The calculus of variations provides a very nice abstraction barrier
for studying nature. Step one, find a variational principle for the
phenomena you're studying. Step two, use conservation laws, generalized
force, momentum, energy, etc. to make some deductions. Lagrange and
Hamilton already did this to classical mechanics (I've got 
[two](../lanlifshitz_1/notes.html) [posts](../lanlifshitz_2/notes.html)
about that) and Fermat found a variational principle for optics back
in the 17th century. A few months ago, when I finised by post about 
[geometrical optics](../optics/optics.html) I thought of joining in the 
fun and finishing what Fermat started by doing some optics analytically.
Watch me use no figures in this entire post.

Fermat's mathematical superpower was definitely his skill of asking "what if?"
appropriately. He was looking at Pythagorean triples, "what if the power isn't 
two?" Later on he was reading an old optics book that said that the movement
of light in a uniform medium can be described as the path of least *length,*
"well that doesn't work for non-uniform media, what if its the path of least
*time?*" He also knew some basic calculus by then so he got to work and managed
to prove Snell's law this way. In short, he found a variational principle
for optics.

%{(Axiom)}% The path $\gamma : [0,1] \to \R^2$ taken by light is the path
that satisfies $\delta T = 0$ where $T$ is the time it takes light to traverse
$\gamma.$ This is often called *Fermat's principle* or *the principle of least 
time.*

Suppose that $\gamma(t) = (x(t), y(t)).$ The time it takes for light
to traverse an infinity small part $\d s$ of $\gamma$ is $\d T = \d s/v(x,y)$ 
where $v(x,y)$ is used to indicate the speed of light at the point $(x,y).$ It 
is clear that $\d s = \sqrt{\d x^2 + \d y^2}.$ Since $\d x = \dot{x}\,\d t$ 
and $\d y = \dot{y}\,\d t,$ then $\d s = \sqrt{\dot{x}^2 + \dot{y}^2}\,\d t.$
Restating $\d T$ in this way results in $\d T = \d t\sqrt{\dot{x}^2 + 
\dot{y}^2}/v(x,y).$ Therefore the time it takes for light to traverse $\gamma$ 
is
$$
\begin{equation}
T = \int_0^1 \frac{\sqrt{\dot{x}^2 + \dot{y}^2}}{v(x,y)}\,\d t.
\end{equation}
$$
This integral is clearly analogous to the action of classical mechanics. The
integrand is also analogous to the Lagrangian. So we will be calling
$$\begin{equation}
L = \frac{\sqrt{\dot{x}^2 + \dot{y}^2}}{v(x,y)}
\end{equation}$$ 
the *optical Lagrangian* from now on. We have now officially crossed the
abstraction barrier of the variational calculus, and now can use its results
to make some deductions.

The greatest result of the calculus of variations is the *Euler-Lagrange 
equation.*
$$
\begin{equation}
\frac{\d}{\d t}\frac{\partial L}{\partial \dot{q}} = \frac{\partial L}{\partial q}.
\end{equation}
$$
Where $\partial L/\partial \dot{q}$ is the *generalized momentum* and 
$\partial L/\partial q$ is the *generalized force*. We may find the momentum
and force in an optical system by substituting (2) to attain
$$
\begin{align}
\vec{p} &= \left(\frac{\dot{x}}{v\sqrt{\dot{x}^2 + \dot{y}^2}}, 
                 \frac{\dot{y}}{v\sqrt{\dot{x}^2 + \dot{y}^2}}\right), \\\\
\vec{F} &= \left(\frac{-\sqrt{\dot{x}^2 + \dot{y}^2}}{v^2}\frac{\partial v}{\partial x},
                 \frac{-\sqrt{\dot{x}^2 + \dot{y}^2}}{v^2}\frac{\partial v}{\partial y}
           \right).
\end{align}
$$
Using these expressions and the fact that $\vec{F} = \dot{\vec{p}}$ we can find the
differential equations for the motion of light.
$$
\begin{aligned}
\frac{(\dot{x}^2+\dot{y}^2)(\ddot{x}v-\dot{x}\dot{v}) -
\dot{x}v(\dot{x}\ddot{x}+\dot{y}\ddot{y})}
{v^2(\dot{x}^2+\dot{y}^2)^{3/2}} &= 
\frac{-\sqrt{\dot{x}^2 + \dot{y}^2}}{v^2}\frac{\partial v}{\partial x}, \\\\
\frac{(\dot{x}^2+\dot{y}^2)(\ddot{y}v-\dot{y}\dot{v})
- \dot{y}v(\dot{x}\ddot{x}+\dot{y}\ddot{y})}
{v^2(\dot{x}^2+\dot{y}^2)^{3/2}} &= 
\frac{-\sqrt{\dot{x}^2 + \dot{y}^2}}{v^2}\frac{\partial v}{\partial y}.
\end{aligned}
$$
Yikes. If you're brave enough you can try to do something with this, but this
ain't for me. Especially because—as we'll see shortly—$v(x,y)$ is almost never
differentiable in a real world scenario. 

For example, when we're consider light's traversal through the boundary
of two different media, we encounter a scenario where $v$ is not differentiable.

Suppose that the line $x = 0$ is the boundary of two regions of space.
To the left of $x=0$ the speed of light is $v_1$ and to the right of it
the speed of light is $v_2.$ Therefore
$$
v(x) = \begin{cases}v_0 & x < 0 \\\\ v_1 & x > 0 \end{cases}
$$
which is obviously not differentiable. That the optical Lagrangian $L$ given by this
choice of the speed of light has symmetry in the $y$-axis. That is, if $\Delta y$ is any
constant
$$\begin{aligned}
L(x, y + \Delta y, \dot{x}, \dot{y})
= \frac{\sqrt{\dot{x}^2 + \dot{y}^2}}{v(x, y + \Delta y)}
= \frac{\sqrt{\dot{x}^2 + \dot{y}^2}}{v(x, y)}
= L(x, y)
\end{aligned}$$
This means that $L$ is constant with respect to $y$. Using this and the Euler-Lagrange equation
we can see that
$$
\frac{d}{dt}\frac{\partial L}{\partial\dot{y}} = \frac{\partial L}{\partial y} = 0
$$
so that the second component of generalized momentum, $\partial L/\partial\dot{y}$ is a
conserved quantity; which we could have also seen by Noether's theorem.
This means that if $(x_0, y_0)$ and $(x_1, y_1)$ are on opposite sides of the $y$-axis, then
by (4)
$$
\frac{\dot{y}_0}{v_0\sqrt{\dot{x}_0^2 + \dot{y}_0^2}}
= \frac{\dot{y}_1}{v_1\sqrt{\dot{x}_1^2 + \dot{y}_1^2}}
$$
Now, notice that $\dot{y} / \sqrt{\dot{x}^2 + \dot{y}^2}$ is equal to the sine of the
angle $\theta$ made by the tangent vector $(\dot{x},\dot{y})$ and the $x$-axis. At $(x_0, y_0)$
we denote this angle by $\theta_0$ and call it the *angle of incidence.* Similarly, we denote
it by $\theta_1$ and call it the *angle of refraction*. We conclude that
$$
\frac{\sin\theta_0}{v_0} = \frac{\sin\theta_1}{v_1}
$$
which is the widely known *Snell's law* or the *law of refraction.*

The law of reflection follows as a special case of the law of refraction. If the $y$-axis
is a mirror instead of the boundary between two media, then $v_0 = v_1$ implying that
$\theta_0 = \theta_1$ Therefore, the angle of incidence is equal to the angle of reflection
(which takes the place of the angle of refraction).


%{(Theorem)}% When light bounces off of a mirror, the angle of incidence
is equal to the angle of reflection.

<!-- I have freely used conservation of momentum in these proofs. This is because
that the laws of optics—i.e., Fermat's principle—are homogeneous with respect
to space, and the homogeneity of space implies the conservation of momentum
as discussed [here](../lanlifshitz_2/notes.html#mom). However, since 
$\partial L/\partial t = 0,$ then optics is also homogeneous with respect to "time"
%{(Note "The variable $t$ isn't really time. It's just a parameter with which we 
define the path of light parametrically. I would've used another symbol like 
$\\tau$ if it wasn't hard to type repeatedly.")}%. As such we must also be able 
to use conservation of energy
$$\begin{equation}
E = \frac{\partial L}{\partial \dot{x}}\dot{x} + \frac{\partial L}{\partial \dot{y}}\dot{y}
- L
\end{equation}$$
to solve some problems. But things get a little weird when we expand (7) with (2)
$$\begin{aligned}
E &= \frac{\partial L}{\partial \dot{x}}\dot{x} + \frac{\partial L}{\partial \dot{y}}\dot{y} - L
\\\\
&= \frac{\dot{x}^2}{v\sqrt{\dot{x}^2 + \dot{y}^2}} + 
   \frac{\dot{y}^2}{v\sqrt{\dot{x}^2 + \dot{y}^2}} -
   \frac{\sqrt{\dot{x}^2 + \dot{y}^2}}{v} \\\\
&= \frac{\dot{x}^2 + \dot{y}^2 - \dot{x}^2 - \dot{y}^2}{v\sqrt{\dot{x}^2 + \dot{y}^2}} \\\\
&= 0.
\end{aligned}$$
I guess this means that the conservation of optical energy is much
simpler than I thought!

A simpler derivation of this can be given by some geometric intuition. Since
the direction of $\vec{p}$ is the same as $\vec{v} = (\dot{x}, \dot{y}),$
then $|\vec{p}||\vec{v}| = \vec{p}\cdot\vec{v}.$ Expanding both sides of
this equality results in
$$
L = \frac{\sqrt{\dot{x}^2 + \dot{y}^2}}{v(x,y)} = 
\frac{\partial L}{\partial \dot{x}}\dot{x} + \frac{\partial L}{\partial \dot{y}}\dot{y}
$$
which can be further simplified to show that the optical energy is always zero.
There is another way to prove this using 
[Euler's theorem on homogeneous functions](../lanlifshitz_2/notes.html#Energy)
which I leave as an exercise to the reader. -->

And that's about it for this very theory heavy post. No new results, all of
it just a fancy restatement of what we knew in [the last post](../optics/optics.html).
To compensate I'll make a post about some of the nice exercises in 
[*A Treatise on Geometrical Optics*](https://archive.org/details/atreatiseongeom00hermgoog/page/n22/mode/1up) sometime in the near future.

%{(Footnotes)}%
