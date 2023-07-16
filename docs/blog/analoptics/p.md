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
which is obviously not differentiable. Luckily, we can continue to study
this scenario because we can use momentum. Let $\vec{p}_0$ be the momentum
to the left of $x=0$ and $\vec{p}_1$ be the momentum to the right of $x=0.$
Plugging this in (4) gives
$$\begin{aligned}
\vec{p}\_0 = \left(\frac{\dot{x}_0}{v\_0\sqrt{\dot{x}_0^2 + \dot{y}_0^2}}, 
                 \frac{\dot{y}_0}{v_0\sqrt{\dot{x}_0^2 + \dot{y}_0^2}}\right), \\\\
\vec{p}\_1 = \left(\frac{\dot{x}_1}{v\_1\sqrt{\dot{x}_1^2 + \dot{y}_1^2}}, 
                 \frac{\dot{y}_1}{v_1\sqrt{\dot{x}_1^2 + \dot{y}_1^2}}\right).
\end{aligned}$$
In polar coordinates these may be written as $\vec{p}_0 = 
|\vec{p}_0|(\cos\theta_0,\sin\theta_0)$ and $\vec{p}_1 = 
|\vec{p}_1|(\cos\theta_1,\sin\theta_1)$ for some $\theta_0$ and $\theta_1.$
In this sense, conservation of momentum $\vec{p}_0 = \vec{p}_1$ implies
that $|\vec{p}_0|\sin\theta_0 = |\vec{p}_1|\sin\theta_1.$ Furthermore,
since $|\vec{p}_0| = 1/v_0$ and $|\vec{p}_1| = 1/v_1,$ then
$$\begin{equation}
\frac{\sin\theta_0}{v_0} = \frac{\sin\theta_1}{v_1}
\end{equation}$$
which is known as *Snell's law* or the *law of refraction.*

%{(Theorem)}% When light traverses the boundary between two media,
$\sin\theta_0/v_0 = \sin\theta_1/v_1$ where $\theta_0$ is the angle
of incidence, $\theta_1$ is the angle of refraction, and $v_0$ and 
$v_1$ are the speeds of light in the the first and second medium 
respectively.

A similar argument suffices to show the law of reflection. Suppose 
that—in a uniform medium where $v = v_0$—a mirror is placed on the 
line $y=0.$ A path of light starts at $P=(x_0, y_0),$ hits the mirror,
and ends up at $Q=(x_1, y_1).$ Before hitting the mirror, the momentum
of light is
$$
\vec{p}\_0 = \left(\frac{\dot{x}_0}{v\_0\sqrt{\dot{x}_0^2 + \dot{y}_0^2}}, 
                   \frac{\dot{y}_0}{v_0\sqrt{\dot{x}_0^2 + \dot{y}_0^2}}\right).
$$
And after hitting the mirror the momentum becomes
$$
\vec{p}\_1 = \left(\frac{\dot{x}_1}{v\_0\sqrt{\dot{x}_1^2 + \dot{y}_1^2}}, 
                   \frac{\dot{y}_1}{v_0\sqrt{\dot{x}_1^2 + \dot{y}_1^2}}\right).
$$
Just as in our discussion of refraction, the conservation of momentum
$\vec{p}_0 = \vec{p}_1$ implies that $|\vec{p}_0|\sin\theta_0 = 
|\vec{p}_1|\sin\theta_1.$ Since this time $|\vec{p}_0| = |\vec{p}_1| = 1/v_0,$
then it follows that $\sin\theta_0 = \sin\theta_1.$ As both angles are less than
$180^\circ,$ we can say that $\theta_1 + 90^\circ = \theta_0$ without loss of
generality. As $\theta_0$ is the angle of incidence, and $\theta_1 + 90^\circ$
is the angle of reflection, then the angle of incidence equals to the angle
of reflection.

This fact can also be shown with Snell's law. Since light is travelling in a
uniform medium, the law of reflection reduces to the case where $\sin\theta_0
= \sin\theta_1.$ From which it follows that $\theta_1 + 90^\circ = \theta_0.$

%{(Theorem)}% When light bounces off of a mirror, the angle of incidence
is equal to the angle of reflection.

I have freely used conservation of momentum in these proofs. This is because
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
which I leave as an exercise to the reader.

And that's about it for this very theory heavy post. No new results, all of
it just a fancy restatement of what we knew in [the last post](../optics/optics.html).
To compensate I'll make a post about some of the nice exercises in 
[*A Treatise on Geometrical Optics*](https://archive.org/details/atreatiseongeom00hermgoog/page/n22/mode/1up) sometime in the near future.

%{(Footnotes)}%
