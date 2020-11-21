%{
Author: Parth Pathak (2020PCS1013)

Solve the following problem using linprog and also graphically (do not use the equality
constraint to reduce the number of variables).

Maximize  x1 + 4x2
such that x1 + 2x2 <= 5
          x1 + x2 = 4
          x1 - x2 >= 3
          x1, x2 >= 0
%}

f=[1;4];
A=[1,2;-1,1];
b=[5;-3];
Aeq=[1,1];
beq=4;
lb=[0;0];
x=linprog(f,A,b,Aeq,beq,lb);
disp(x);

%{
Graphical optimization: 
1) Plot objective function. 
2) Find the feasible region by plotting infeasible area due to inequality constraints (hatched regions). 
3) Plot the equality constraint line.
4) Find the optimum solution that satisfies the inequality constraints and the equality constraint.
The blue filled circle is the optimum solution.
%}

[x1,x2]=meshgrid([2.5:0.1:5.5],[0:0.1:1]);
f=x1+4*x2; % objective function
colormap([0 0 0; jet; 1 1 1])
contourf(x1,x2,f)
shading flat

hold on
con1=x1+2*x2-5-10; % constratint function x1+2x2<=5
[c1, h1] = contourf(x1,x2,con1, [0 0]-10);

con2=x2-x1+3+10; % constratint function x1-x2>=3
[c2, h2] = contourf(x1,x2,con2, [0 0]+10);

plot([4,3],[0,1],'-m','Linewidth',2.5) % x1+x2=4
plot(4, 0, '.b', 'MarkerSize',69) % optimum solution
% x1 and x2 are always greater than 0 in this domain

hold off

%hPatch1 = findobj(h1, 'Type', 'patch');
%hPatch2 = findobj(h2, 'Type', 'patch');

%hh1 = hatchfill(hPatch1, 'single', -45, 6);
%hh2 = hatchfill(hPatch2, 'single', 45, 6);
