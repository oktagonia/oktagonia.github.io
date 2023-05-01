%{(Post "The Hypotenuse of a Recurrence Triangle" "March 2023")}%

The third theorem of this post first appeared, as far as I can tell, as a
problem in the entrance exam of a prominent Iranian high school. I heard of
this through my friend who participated in that exam.

-----

The recurrence triangle is a triangle of numbers where each of its rows are generated via a combination of the rows which are above it. In this article we are primarily interested in
what we'll call the *Fibonacci triangle*. It is a recurrence triangle where the first two
rows consist of the Fibonacci sequence, albeit the second one is shifted to the right; and
the following rows are generated by the pairwise sum of the two rows above them, each time
shifting to the right. The following table is the Fibonacci triangle after 7 iterations.
<center>
<table style='padding: 10px'>
<tr>
    <td style='width:30px'>0</td> <td style='width:30px'>1</td> <td style='width:30px'>1</td> <td style='width:30px'>2</td> <td style='width:30px'>3</td> <td style='width:30px'>5</td> <td style='width:30px'>8</td> <td style='width:30px'>...</td>
</tr>
<tr>
    <td> </td> <td>0</td> <td>1</td> <td>1</td> <td>2</td> <td>3</td> <td>5</td> <td>⋯</td>
</tr>
<tr>
    <td> </td> <td> </td> <td>2</td> <td>3</td> <td>5</td> <td>8</td> <td>13</td> <td>⋯</td>
</tr>
<tr>
    <td> </td> <td> </td> <td> </td> <td>4</td> <td>7</td> <td>11</td> <td>18</td> <td>⋯</td>
</tr>
<tr>
    <td> </td> <td> </td> <td> </td> <td> </td> <td>12</td> <td>19</td> <td>31</td> <td>⋯</td>
</tr>
<tr>
    <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td>30</td> <td>49</td> <td>⋯</td>
</tr>
<tr>
    <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td>80</td> <td>⋯</td>
</tr>
<tr>
    <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td> </td> <td>⋱<td>
</tr>
<caption style='caption-side:bottom'>The Fibonacci recurrence triangle</caption>
</table>
</center>
Before we can start exploring the interesting properties of this triangle, we have to introduce some notation for dealing with it. So let $\binom{x}{y}$ be the number at the $x$th row and $y$th column, if we treat the triangle as a grid of numbers. For instance, 
$\binom{3}{3} = 2$, not $5$! You should keep in mind that the $k$th number of the hypotenuse
is denoted as $\binom{k}{k}$.

The first thing that one notices when looking at this triangle is that the rows also happen to be recurrence relations; and not just the first two! For example, $\binom{6}{3} + \binom{7}{3} = \binom{8}{3}$!  This fact can be shown in its general form via induction.

**Theorem 1.** The rows of the Fibonacci recurrence triangle are three-term linear recurrence relations. More specifically, $\binom{m}{n} = \binom{m}{n-1} + \binom{m}{n-2}$.

*Proof.* This should be evident for the first two rows, which are Fibonacci sequences. So we may assume as our inductive hypothesis that this property holds up to row $m$ of the triangle. In row $m+1$, we have $\binom{m+1}{n} = \binom{m}{n} + \binom{m-1}{n}$, $\binom{m+1}{n-1} = \binom{m}{n-1} + \binom{m-1}{n-1}$, and $\binom{m+1}{n-2} = \binom{m}{n-2} + \binom{m-1}{n-2}$. By using our inductive hypothesis we can see that:
$$
\begin{aligned}
\binom{m+1}{n} &= \binom{m}{n} + \binom{m-1}{n} \\\\
&= \binom{m}{n-1}+\binom{m}{n-2}+\binom{m-1}{n-1}+\binom{m-1}{n-2} \\\\
&= \binom{m}{n-1}+\binom{m-1}{n-1}+\binom{m}{n-2}+\binom{m-1}{n-2} \\\\
&= \binom{m+1}{n-1} + \binom{m+1}{n-2}
\end{aligned}
$$
Which is what we wanted to show.

Some astute readers might now be puzzled by our use of a triangle as opposed to a rectangle. If each row is the pairwise sum of the two rows above it, then why don't we apply this rule to the first few columns? The reason we don't is that the Fibonacci rectangle is actually symmetric with respect to its diagonal. So we have no use of accounting for the whole rectangle.

<center>
<table style='padding: 10px'>
<tr>
    <td style='width:30px'><b>0</b></td> <td style='width:30px'>1</td> <td style='width:30px'>1</td> <td style='width:30px'>2</td> <td style='width:30px'>3</td> <td style='width:30px'>5</td> <td style='width:30px'>8</td> <td style='width:30px'>...</td>
</tr>
<tr>
    <td>1</td> <td><b>0</b></td> <td>1</td> <td>1</td> <td>2</td> <td>3</td> <td>5</td> <td>⋯</td>
</tr>
<tr>
    <td>1</td> <td>1</td> <td><b>2</b></td> <td>3</td> <td>5</td> <td>8</td> <td>13</td> <td>⋯</td>
</tr>
<tr>
    <td>2</td> <td>1</td> <td>3</td> <td><b>4</b></td> <td>7</td> <td>11</td> <td>18</td> <td>⋯</td>
</tr>
<tr>
    <td>3</td> <td>2</td> <td>5</td> <td>7</td> <td><b>12</b></td> <td>19</td> <td>31</td> <td>⋯</td>
</tr>
<tr>
    <td>5</td> <td>3</td> <td>8</td> <td>11</td> <td>19</td> <td><b>30</b></td> <td>49</td> <td>⋯</td>
</tr>
<tr>
    <td>8</td> <td>5</td> <td>13</td> <td>18</td> <td>31</td> <td>49</td> <td><b>80</b></td> <td>⋯</td>
</tr>
<tr>
    <td>⋮</td> <td>⋮</td> <td>⋮</td> <td>⋮</td> <td>⋮</td> <td>⋮</td> <td>⋮</td> <td>⋱<td>
</tr>
<caption style='caption-side:bottom'>The Fibonacci recurrence rectangle</caption>
</table>
</center>

**Theorem 2.** The Fibonacci rectangle, as defined above, is symmetric with respect to the diagonal. This fact may stated more precisely as $\binom{a}{b} = \binom{b}{a}$.

*Proof.* This fact should be clear for the first few rows of our rectangle, since the first row and the first column are both the Fibonacci sequence. So we may assume that this property holds up to row $m$ of the rectangle. From the definition of the Fibonacci rectangle we know that $\binom{m+1}{n} = \binom{m}{n} + \binom{m-1}{n}$.  By our inductive hypothesis, it should be clear that $\binom{m+1}{n} = \binom{n}{m} + \binom{n}{m-1}$, which by theorem 1, is equal to $\binom{n}{m+1}$. Therefore, $\binom{m+1}{n} = \binom{n}{m+1}$. So we are done.

An interesting problem involving this triangle is the nature of its hypotenuse. 
Interestingly, we can interpret it as a sequence in its own right and, given 
enough introspection, one notices that it is generated with a recurrence
relation of its own. This fact is proven by using the previous two theorems.

**Theorem 3.** The hypotenuse of the Fibonacci triangle is a recurrence relation of 4 terms generating via the following rule for all $k > 0$:
$$ \binom{k}{k} = 2\left [ \binom{k-1}{k-1} + \binom{k-2}{k-2} \right ] - \binom{k-3}{k-3}.$$

*Proof.* By the theorem 1,  $\binom{k}{k} = \binom{k}{k-1} + \binom{k}{k-2}$ which is in turn equal to $\binom{k-1}{k-1} + \binom{k-2}{k-1} + \binom{k-1}{k-2} + \binom{k-2}{k-2}$.   Since $\binom{k-2}{k-1} = \binom{k-1}{k-1} - \binom{k-3}{k-1}$, and $\binom{k-1}{k-2} = \binom{k-2}{k-2} + \binom{k-3}{k-2}$, then $\binom{k}{k} = 2\left [ \binom{k-1}{k-1} + \binom{k-2}{k-2} \right ] + \binom{k-3}{k-2} - \binom{k-3}{k-1}$. And as $\binom{k-3}{k-1} = \binom{k-3}{k-2} + \binom{k-3}{k-3}$, we can see that:
$$
\begin{aligned}
\binom{k}{k} &= 2\left [ \binom{k-1}{k-1} + \binom{k-2}{k-2} \right ] + \binom{k-3}{k-2} - \binom{k-3}{k-1}, \\\\
&= 2\left [ \binom{k-1}{k-1} + \binom{k-2}{k-2} \right ] - \binom{k-3}{k-3}.
\end{aligned}
$$
Which is what we intended to show.