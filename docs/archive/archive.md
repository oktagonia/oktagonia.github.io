<style>
table { border-collapse: collapse; width: 100%; }
td, th { padding: 6px 12px; border: 1px solid #ddd; }
th { background: #f9f9f9; }
</style>

# Archive

## Teaching

<table>
  <tr>
    <th>Course</th>
    <th colspan="11">Weeks</th>
  </tr>
  <tr>
    <td>MATA31</td>
    <td>-</td>
    <td><a href="mata31/a31_week2.pdf">2</a></td>
    <td><a href="mata31/a31_week3.pdf">3</a></td>
    <td><a href="mata31/a31_week4.pdf">4</a></td>
    <td><a href="mata31/a31_week5.pdf">5</a></td>
    <td><a href="mata31/a31_week6.pdf">6</a></td>
    <td>-</td>
    <td><a href="mata31/a31_week8.pdf">8</a></td>
    <td><a href="mata31/a31_week9.pdf">9</a></td>
    <td><a href="mata31/a31_week10.pdf">10</a></td>
    <td><a href="mata31/a31_week11.pdf">11</a></td>
  </tr>
</table>

## Miscellany

1. [The Curse of Monte Carlo](The_Curse_of_Monte_Carlo.pdf). A worksheet
  exploring the curse of dimensionality, numerical integration, and the
  Monte Carlo method. Meant to introduce these ideas to intro probability students
  at the University of Toronto.

1. [A proof of the additivity of the Riemann integral](integral_property.pdf).
  Most textbooks which prove the property
  $$
  \int_a^b f(x)\,dx = \int_a^c f(x)\,dx + \int_c^b f(x)\,dx
  $$
  do it via upper and lower sums and the Darboux definition of the Riemann
  integral. Textbooks which don't cover the Darboux definition usually skip
  the proof of this fact. This is because a satisfying proof directly from
  Riemann sums has to deal with the subtle special case that $b - c$ and
  $c - a$ are incommensurable and so no two Riemann partitions on the intervals
  $[a,c]$ and $[c,b]$ will have equal equal subintervals. This file contains
  a short proof of this fact using Riemann partitions alone.

1. [Fibonacci Triangle Problem](fib-triangle.pdf). My solution to an
  interesting number theory (?) problem involving a triangle of fibonacci
  numbers.

1. [Lambda Calculus Presentation](lambda-pres.pdf). The presentation I
  gave at for the UofT mentorship program.

1. [Lambda Calculus Notes](lambda-notes.pdf). My notes from the UofT
  mentorship program about the lambda-calculus. Still needs some polishing and I
  also intend to make a lambda-calculus interpreter for this by using the
  definitions.
