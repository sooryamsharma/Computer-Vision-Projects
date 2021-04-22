function [Q] = find_intersection(a1,a2,b1,b2)
syms x y z
u = [x;y;z];

Aeq=null(a1-a2).';  %2x3
beq=Aeq*a1.';   %2x1
eqn_a = Aeq*u==beq;

Aeq=null(b1-b2).';  %2x3
beq=Aeq*b1.';   %2x1
eqn_b = Aeq*u==beq;

[A,B] = equationsToMatrix([eqn_a, eqn_b], [x, y, z]);
Q = linsolve(A,B);

end

