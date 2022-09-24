<!--
("Scientific Computing" (july 3 2022) "blog/sip.html")
-->

%{(Post "Scientific Computing" "July 2022")}%

Ever since Newton, science has been the tool *par excellence* available to humans to deal 
with any sort of problem. Thus it seems that the most practical thing to do in any situation is 
to understand it by means of the scientific method. It is understandable then that historical 
views on computers focused much on their ability to further advance science. Notably, Leibinz
thought that that machines like his
[Stepped Reckoner](https://en.wikipedia.org/wiki/Stepped_reckoner) could carry out rote
computation while scholars spent their time on more pressing matters:

> It is beneath the dignity of excellent men to waste their time in calculation when any 
> peasant could do the work just as accurately with the aide of a machine.

However, we must be much more ambitious in the 21st century. Computing no longer seems
to involve mere number crunching, but something of a more general character. So how might 
we use computing to advance science? And more specifically, how would such a program look like? What is it's general architecture?

The scientific method begins by observation, so let's find some examples of programs that all
would consider to be made to aide the scientist. First let's take a look at computer algebra,
(such as Mathematica, Macsyma, Maple, Sage, etc...) one of the first such programs, and we 
shall also see an example implementation.

## Computer algebra

The core of a computer algebra system is... well algebra. So we must have a way of 
*representing* algebraic expressions. After we have found such a representation, we must
have a way to play around with our representations. For example, we may want to 
differentiate a particular expression, or to solve a particular equation, etc. Let's focus on the
representation problem for now.

The user now inputs something similar to $a\times x\times x + bx$, this is currently merely a 
string in the computer's memory. Differentiating a string is quite difficult, so we need a more 
convienient data structure to use. The key idea is that the four arithmetic operations are 
defined to be functions of two variables. For instance, $+ : \mathbb{R}\times\mathbb{R} \to 
\mathbb{R}$, which means that given any two numbers in $\mathbb{R}$, it will return 
another number that is in $\mathbb{R}$. This gives us a hint, these four operations are simply
multivariable functions, we may write them as such. So our previous expression becomes:
$$+(\times(a, \times(x, x)), \times(b, x))$$
Our expressions are now of the form $\mathit{operator}(x, y)$, so the function being called and 
it's arguments are quite clear, to human readers at least. To make it understandable to a 
computer, we can use *lists*%{(Note "Here we use the classic LISP notation for discussing 
lists. For example, a list containing <var>a</var>, <var>b</var>, and <var>c</var>
would be written as `(a b c)`."
)}%, the first element of the list is the operator, and the rest are the 
arguments given to it. So we can state some general rules for translating between human 
notation and our computer representation of it:

1. $x + y$ becomes `(+ x y)`
2. $x - y$ becomes `(- x y)`
3. $x \times y$ becomes `(* x y)`
4. $x \div y$ becomes `(/ x y)`

We can now translate our original expression into something that is understandable by a computer.
<center>
$a\times x\times x + b\times x$ becomes <code>(+ (* a (* x x)) (* b x))</code>
</center>

So now what? Well the user may want to do something with this data. For instance, she may want to
differentiate the given expression. How are we gonna do that? I mean the majority of humans struggle
with this task, how are going to make a computer do it? To begin this daunting task, a good place to
start is to see how humans (at least those who can differentiate) do it. For most of us, that is
repeatedly applying the following rules %{(Note "I will ignore the chain rule in this article.")}%:

1. $D_x c = 0$ where $c \neq x$.
2. $D_x x = 1$
3. $D_x (f+g)(x) = f'(x) + g'(x)$
4. $D_x (f*g)(x) = f'(x)g(x) + f(x)g'(x)$

So what if we wrote a program that exactly that? Given an expression, it would check to see if it is
similar to any of the above, and then it would apply that rule. For example, given the expression
$x + 1$, it would notice that it involves addition, invoke the third pattern to get $D_xx + D_x 1$.
On the left side, it would notice that this is the second rule and return 1. Hence the expression is
further reduced to $1 + D_x 1$. On the left side it would now notice that it satisfies the first rule
and so return 0, the final expression being $1 + 0 = 0$.

Based on the above example, we can come up with a differentiation procedure to push down the throats 
of senior high school students, lest they develop any interest in math. As arguments, the procedure
takes in an algebraic expression, and the variable of differentiation.

1. If the expression is not the variable of differentiation, then the derivative is equal to 0.
2. If the expression is the variable of differentiation, then the derivative is equal to 1.
3. If the expression is of the form $x+y$, then the derivative is $x' + y'$.
4. If the expression is of the form $x*y$, then the derivative is $x'y + xy'$.

Ok, so now we want to write a program that a computer can execute. This is quite easy to do with
our representation! All we need to do is to translate our algebraic expressions into our 
representation with lists. We define `(diff expr var)` to be:

1. If `expr` ≠ `var`, then `(diff expr var)` = 0.
2. If `expr` = `var`, then `(diff expr var)` = 1.
3. If `(operator expr)` = `+`, then `(diff expr var)` = <br>
   <pre><code>(+ (diff (left expr) var) (diff (right expr var) var))</code></pre>
3. If `(operator expr)` = `*`, then `(diff expr var)` = 
   <pre><code>(* (+ (diff (left expr) var) (right expr)) 
      (+ (diff (right expr) var) (left expr)))</code></pre>
      
Translating this into an actual programming language isn't too hard, here's an example in 
[scheme](https://en.wikipedia.org/wiki/Scheme_(programming_language\)):
<pre><code>(define (operator expr) (car expr))
(define (left expr) (cadr expr))
(define (right expr) (caddr expr))

(define (diff expr var)
  (cond ((and (symbol? expr) (not (equal? expr var))) 0)
        ((equal? expr var) 1)
        ((equal? (operator expr) '+)
         `(+ ,(diff (left expr) var) ,(diff (right expr) var)))
        ((equal? (operator expr) '*)
         `(+ (* ,(diff (left expr) var) ,(right expr))
             (* ,(diff (right expr) var) ,(left expr))))
        (else (error "the given expression is not supported"))))</code></pre>

Now we can differentiate the expression we started with! We'll just plug in
`(diff '(+ (* a (* x x)) (* b x)) 'x)` into the interpreter and we get:
<pre><code>         (+ (+ (* 0 (* x x)) (* (+ (* 1 x) (* 1 x)) a)) 
            (+ (* 0 x) (* 1 b)))</code></pre>

As you can see, there are several problems with this implementation. 
The obvious problem is the unsimplified output of the program, which
makes it very hard for us to verify its answers (I am quite certain that 
you, the reader, did not bother to verify it). Though the more important
issue, in my opinion, is that the representation we setteled on isn't 
"humane" enough. When doing science, we usually write our algebraic 
expressions in an *infix notation*. Our computer representation makes it 
harder for us to interface with our thoughts as written on paper or 
blackboard. And the action of interfacing between thought and computer is 
an essential problem of scientific computing.

So how might we begin to solve these problems? Well for the simplification
task we can use the same problem-solving strategy that we used before, that
is by understanding what humans do to simplify and them replicating that by
using our computer representation.

%{(Footnotes)}%
