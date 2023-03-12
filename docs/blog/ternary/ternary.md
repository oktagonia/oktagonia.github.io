%{(Post "Three-Valued Logic in the λ-Calculus" "January 2023")}%

<style>
table, td, th {
    border: 1px solid black;
}

table {
    border-collapse: collapse;
}
</style>

**Abstract.** We define our three logical values in a similar fashion to 
the Church-encoding of booleans:

* $\mathbf{T} := \lambda xyz.x$
* $\mathbf{F} := \lambda xyz.y$
* $\mathbf{X} := \lambda xyz.z$

And these are some common logical connectives:

Connective              | Implementation
----------------------- | --------------------------------
Negation                | $ \neg x  := x\mathbf{F}\mathbf{T}\mathbf{X}$
Conjunction             | $x\land y := xyx(y\mathbf{X}\mathbf{F}\mathbf{X})$
Disjunction             | $x\lor y  := x\mathbf{T}y(y\mathbf{T}\mathbf{X}\mathbf{X})$
Łukasiewicz implication | $x\to y   := xy\mathbf{T}(y\mathbf{T}\mathbf{X}\mathbf{T})$
Kleene implication      | $x\to y   := \neg x \lor y$

## What is ternary logic?

The logic most of us are deeply familiar with is the two-valued, true-or-false,
boolean logic. This is because it is the simplest and most intuitive logic, having
been directly formulated based on human intuition. As a result, it carries with it
some of the difficulties with our intuitions of truth. For instance, classical
logic requires a sentence to be either true or false, lest every sentence be counted
as true. This is known as the principle of explosion.

[![xkcd 704](https://imgs.xkcd.com/comics/principle_of_explosion.png)](https://xkcd.com/704/)

**Theorem** *(Principle of explosion)*. If $P$ and $\neg P$ are true, then all
sentences $Q$ are true. Otherwise stated as $\forall Q, (P \land \neg P) \to Q$.

*Proof.* Since $P$ is true, then $P \lor Q$ is true for all propositions $Q$. But since we
have $\neg P$, then $Q$ must be true. For instance:

1. Snow is white and snow is black; $P \land \neg P$.
2. Snow is white or you're mother's number is 905-764-6464; $P \lor Q$.
3. Snow is black; $\neg P$.
4. Therefore, you're mother's number is 905-764-6464; $Q$.

The xkcd comic above is a little bit misleading. If your system is contradictory, then 
*everything* is your mom's phone number! A contradictory system predicts that if you dial
"what's the difference between an enzyme and a hormone," then your mother will pick up the
phone, as well as Aristotle—who will surely be mad at you for letting a contradiction slip
into your system. To avoid such a confrontation, some logicians have invented logical systems
which do not allow this dreaded possibility. These are called *paraconsistent logics*, and
(some) three-valued logics are of this type.

The way ternary logic deals with the principle of explosion is by introducing a third
value—$\mathbf{X}$, meaning *both true and false*—besides the usual *true* and *false*.
Then by cleverly defining the usual logical relations, we can obtain a logic which allows
its user to have contradictictory notions without being punished by Aristotle. The one being
shown here is Kleene-Priest incantation. Firstly, we allowed $\mathbf{T}$ and $\mathbf{X}$ to
be *designated* values. That is, we are allowed to use a sentence for further deduction if
its truth-value is either $\mathbf{X}$ or $\mathbf{T}$. Then we define the common logical
relations as follows:

<center>
<div style='display: inline-block;'>

<table style='margin: auto 10px auto 10px; float: left;'>
<tr><td></td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{F}$</td></tr>
<tr><td>$\mathbf{T}$</td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{F}$</td></tr>
<tr><td>$\mathbf{X}$</td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{X}$</td></tr>
<tr><td>$\mathbf{F}$</td><td>$\mathbf{T}$</td><td>$\mathbf{T}$</td><td>$\mathbf{T}$</td></tr>
<caption>$P \to Q$</caption>
</table>

<table style='margin: auto 10px auto 10px; float: left;'>
<tr><td></td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{F}$</td></tr>
<tr><td>$\mathbf{T}$</td><td>$\mathbf{T}$</td><td>$\mathbf{T}$</td><td>$\mathbf{T}$</td></tr>
<tr><td>$\mathbf{X}$</td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{X}$</td></tr>
<tr><td>$\mathbf{F}$</td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{F}$</td></tr>
<caption>$P \lor Q$</caption>
</table>

<table style='margin: auto 10px auto 10px; float: left;'>
<tr><td></td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{F}$</td></tr>
<tr><td>$\mathbf{T}$</td><td>$\mathbf{T}$</td><td>$\mathbf{X}$</td><td>$\mathbf{F}$</td></tr>
<tr><td>$\mathbf{X}$</td><td>$\mathbf{X}$</td><td>$\mathbf{X}$</td><td>$\mathbf{F}$</td></tr>
<tr><td>$\mathbf{F}$</td><td>$\mathbf{F}$</td><td>$\mathbf{F}$</td><td>$\mathbf{F}$</td></tr>
<caption>$P \land Q$</caption>
</table>
<table style='margin: auto 10px auto 10px; float: left;'>
<tr><td>$\mathbf{T}$</td><td>$\mathbf{F}$
<tr><td>$\mathbf{X}$</td><td>$\mathbf{X}$
<tr><td>$\mathbf{F}$</td><td>$\mathbf{T}$
<caption>$\neg P$</caption>
</table>

</div>
</center>

Well, how does this logic avoid the principle of explosion? Remember that the formal 
statement of that principle is $(P \land \neg P) \to Q$. For us to be able to make 
deductions based on this sentence, it would either have to be $\mathbf{T}$ or $\mathbf{X}$
for all possible values of $Q$. By looking at the table, we can see that the left side of
the implication cannot be $\mathbf{T}$, because in that case then the implication wouldn't
hold for all $Q$. So $P \land \neg P$ must either be $\mathbf{X}$ or $\mathbf{F}$. If it is
$\mathbf{F}$, then it's nothing out of the ordinary—that's just plain ol' classical logic.
However if it is $\mathbf{X}$, then—unlike classical logic—we may use $P \land \neg P$ in
further deductions! Besides that, $P$ has to be $\mathbf{X}$, indicating that it is a
*paradoxical proposition!*

This logic solves many problems such as the liar paradox. Though sadly it doesn't support 
modus ponens. Which is unfortunate because I really like modus ponens.

## What is the λ-calculus?

The λ-calculus is a simple language capable of universal computation. I won't go into full
detail about that here because it's been covered better else where%{(Note "Peter Selinger's
<a href='https://www.mscs.dal.ca/~selinger/papers/#lambdanotes'>lecture notes</a> are
probably the best place to start. Though my own
<a href='https://oktagonia.github.io/archive/lambda-notes.pdf'>notes</a> 
aren't too bad either. In fact this post is the solution to one of the exercises in my 
notes.")}%. For now I'll give a brief overview of the basics of the language and the 
encoding of booleans into it.

<figure>
<img src='https://imgs.xkcd.com/comics/excel_lambda.png' alt='xkcd 2563'>
<figcaption style='text-align: center;'>One more xkcd doesn't hurt</figcaption>
</figure>

As I said before, the λ-calculus is a language invented by Alonzo Church way back in the 30s.
Its interesting because it is capable of universal computation despite being incredibly 
simple. So simple that it only has two kinds of objects: symbols and functions. Symbols are
just alphabetic characters like $x$ and $y$. Functions take the form of $\lambda x.M$. Where 
$x$ is the variable representing the input of the function and $M$ is the expression that
results in the output. The λ-calculus also allows to *apply* any two expressions to each 
other, this is denoted by putting the two expressions next to each other, like $MN$. Symbol 
application is very uninteresting—$x$ applied to $y$ is just $xy$—and function application 
is what you would expect. When applying $\lambda x.M$ to $N$, you replace all instances of 
$x$ in $M$ by the expression $N$. For example, $(\lambda xy.x)(\lambda xy.y)$ is evaluated 
as follows:
$$ \begin{aligned}
(\lambda xy.x)(\lambda xy.y) &\to (\lambda xy.x)(\lambda pq.q) 
\text{\ notice how $\lambda pq.q$ is the same as $\lambda xy.y$.} \\\\
&\to x[\text{replace $x$ with $\lambda pq.q$}] \\\\
&\to \lambda pq.q
\end{aligned} $$

In programming we make use of booleans quite a lot. And since this language doesn't provide
them for us, we must implement them ourselves. The classic way that this is done is due to
Alonzo Church. He started by noticing that there are only two functions that take two
arguments and return one of them. So he defined his truth values as follows:
$$ \begin{aligned}
\mathbf{T} &:= \lambda xy.x,  \\\\
\mathbf{F} &:= \lambda xy.y
\end{aligned} $$
Then he went on and implemented the usual operations of conjunction, disjunction, negation,
and implication. We'll also go throuh the process of deriving these. But the first thing
you have to notice is that since $\mathbf{T}, \mathbf{F}$ are functions of two arguments,
and the connectives are taking these as input, then the body of each connective is going to
be three terms applied to each other. One for the input, the other for the case where the 
input is true, and the other for the case where the input is false.

Lets start with $\neg x$ first because it's the easiest. As we discussed before, the function
probably looks like $\lambda x.xPQ$ for some $P$ and $Q$. Now there are two cases,
either $x = \mathbf{T}$, or $x = \mathbf{F}$. If the first case is true, then we must return
$\mathbf{F}$. So we must pick $P$ and $Q$ such that $\mathbf{T}PQ = \mathbf{F}$. Since
$\mathbf{T}$ returns its first argument and ignores the second one, then we must let $P =
\mathbf{F}$. Similarly, if $x = \mathbf{F}$, then $x\mathbf{F}Q = \mathbf{T}$. In this case,
since $\mathbf{F}$ returns its second argument and ignores the first one, then $Q = 
\mathbf{T}$. So it should be clear that $\neg x := x\mathbf{F}\mathbf{T}$.

The derivation for $x \land y$ and $x \lor y$ are very similar to each other so I'll only go
over disjunction. As before, it probably looks something like $\lambda xy.xPQ$. There are
two cases for $x$, either $x = \mathbf{T}$, or $x = \mathbf{F}$. If it's the first one,
then the disjunction is automatically true. So $P = \mathbf{T}$. If it's the second one,
then the disjunction is valid if and only if $y = \mathbf{T}$. Therefore $Q = y$. As such
$x \lor y := x\mathbf{T}y$.

I'm not going to go over implication because it's quite simple. You can either do it the
same way we did the previous ones, or use the fact that $x \to y = \neg x \lor y$ and do
the reduction yourself. In short, implication is $\lambda xy.xy\mathbf{T}$.

## Implementing ternary logic in the λ-calculus

Implementing ternary logic in the λ-calculus isn't too different from implementing classical
logic. The truth-values are implemented in a very similar fashion.
$$ \begin{aligned}
\mathbf{T} := \lambda xyz.x, \\\\
\mathbf{F} := \lambda xyz.y, \\\\
\mathbf{X} := \lambda xyz.z.
\end{aligned} $$
As you can see, it's the exact same concept as the Church-encoding. There are only three
functions of three arguments that return one of their arguments. As a consequence, the
shape of the logical connectives are also quite similar. In booleans, each of them had a 
function body involving the application of three terms. Here, each body is the application
of four terms: one of the arguments, the case where it is true, the case where it is false,
and the case where it is both.

As with booleans, negation is the easiest to implement—its basically identical to the boolean
version. But now we also have to consider the case where $x = \mathbf{X}$ in which case we
just return $\mathbf{X}$. So $\neg x := x\mathbf{F}\mathbf{T}\mathbf{X}$.

Disjunction and conjunction are little bit more complicated than the boolean case. Lets deal
with disjunction for now. As we know the function looks something like $\lambda xy.xPQR$.
Now we have three cases for $x$:

1. If $x = \mathbf{T}$, then the output is automatically true. So $P = \mathbf{T}$.
2. If $x = \mathbf{F}$, then the output is the same as $y$—just like the boolean version. So
$Q = y$.
3. If $x = \mathbf{X}$, then the output is $\mathbf{X}$ unless $y = \mathbf{T}$, in which 
case it is $\mathbf{T}$. As such, $R$ is an expression in terms of $y$. By the same reasoning
as above, we can assume that $R = yABC$. If $y = \mathbf{T}$, then $R = \mathbf{T}$. So $A =
\mathbf{T}$. Otherwise, $R = \mathbf{X}$, so $B, C = \mathbf{X}$. Therefore $R = 
y\mathbf{T}\mathbf{X}\mathbf{X}$. 

As such, $x \lor y := x\mathbf{T}y(y\mathbf{T}\mathbf{X}\mathbf{X})$. With the same 
procedure we can find the term of conjuction as well: 
$x \land y := xyx(y\mathbf{X}\mathbf{F}\mathbf{X})$. Kleene implication is just $\neg x \lor 
y$ so I didn't bother finding a term for that. I also did Łukasiewicz implication just
because I could. The results can be found at the top of the page.


%{(Footnotes)}%
