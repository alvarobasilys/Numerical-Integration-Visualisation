function [f] = parabolla(p,q,r)
syms x 
syms y
syms z

eqn1 = x*p(1)^2 + y*p(1) + z == p(2);
eqn2 = x*q(1)^2 + y*q(1) + z == q(2);
eqn3 = x*r(1)^2 + y*r(1) + z == r(2);

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3], [x, y, z]);

solve = linsolve(A,B);

f = solve(1)*x^2+solve(2)*x+solve(3);
