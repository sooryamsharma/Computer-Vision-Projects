%Defining points which lie on the given set of paralell lines
P11=[1,-1,0]; %L1 lies on Pi-plane given by the equation x-1=0;
P12=[1,-1,1];

P21=[0,-1,0];  %L2 lies on Pi-plane given by the equation x=0;
P22=[0,-1,1];
%L1 and L2 are prallel lines

P31=[1/3,-1,0];  %L3 lies on Pi-plane given by the equation 3x+2z-1=0;
P32=[-1/3,-1,1];

P41=[2/3,-1,0];  %L4 lies on Pi-plane given by the equation 3x+2z-2=0;
P42=[0,-1,1];
%L3 and L4 are parallel lines

P51=[1/5,-1,0];  %L5 lies on Pi-plane given by the equation 5x-2z-1=0;
P52=[3/5,-1,1];

P61=[2/5,-1,0];  %L6 lies on Pi-plane given by the equation 5x-2z-2=0;
P62=[4/5,-1,1];
%L5 and L6 are parallel lines

%Taking some easy points on the other side of the image plane
t11=[1,-1,3]; 
t12=[1,-1,2];
t21=[0,-1,3]; 
t22=[0,-1,2];
t31=[-1,-1,2]; 
t32=[-5/3,-1,3];
t41=[-4/3,-1,3]; 
t42=[0,-1,1];
t51=[1,-1,2]; 
t52=[0.6,-1,1];
t61=[1.6,-1,3]; 
t62=[0.8,-1,1];

%Finding projections of the aforementioned points
Q11=project_point(t11);
Q12=project_point(t12);
Q21=project_point(t21);
Q22=project_point(t22);
Q31=project_point(t31);
Q32=project_point(t32);
Q41=project_point(t41);
Q42=project_point(t42);
Q51=project_point(t52);
Q52=project_point(t51);
Q61=project_point(t61);
Q62=project_point(t62);

%Defining view point (setting azimuth and elevation)
title('Task D');
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
view([126 30])
hold on

%Defining Pi and Projection (image) Plane
[x,z] = meshgrid(-4:4,-3:3);
pi_plane = @(x,z)0*x+0*z-1;
surf(x,pi_plane(x,z),z, 'FaceColor', 'black', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
text(3.5,-1,2.5,'\pi Plane')

[x,y] = meshgrid(-4:4,-3:3);
proj_plane = @(x,y)0*x+0*y+1;
surf(x,y,proj_plane(x,z), 'FaceColor', 'cyan', 'FaceAlpha', 0.35, 'EdgeColor', 'none');
text(3.5,2,1.2,'Image Plane')

%Defining three pair (L1||L2, L3||L4, L5||L6) of parallel lines.
syms t
tt = -3:3;

%Plotting L1 : x - 1 = 0
L1 = P11 + t*(P12-P11);
linex = subs(L1(1), t, tt);
liney = subs(L1(2), t, tt);
linez = subs(L1(3), t, tt);
plot3(linex, liney, linez)
text(1,-1,-2,'L1')

%Plotting L2 : x = 0
L2 = P21 + t*(P22-P21);
linex = subs(L2(1), t, tt);
liney = subs(L2(2), t, tt);
linez = subs(L2(3), t, tt);
plot3(linex, liney, linez)
text(0,-1,-2,'L2')


%Plotting L3 : 3x + 2z - 1 = 0
L3 = P31 + t*(P32-P31);
linex = subs(L3(1), t, tt);
liney = subs(L3(2), t, tt);
linez = subs(L3(3), t, tt);
plot3(linex, liney, linez)
text(5/3,-1,-2,'L3')

%Plotting L4 : 3x + 2z - 2 = 0
L4 = P41 + t*(P42-P41);
linex = subs(L4(1), t, tt);
liney = subs(L4(2), t, tt);
linez = subs(L4(3), t, tt);
plot3(linex, liney, linez)
text(2.3,-1,-2,'L4')

%Plotting L5 : 5x - 2z - 1 = 0
L5 = P51 + t*(P52-P51);
linex = subs(L5(1), t, tt);
liney = subs(L5(2), t, tt);
linez = subs(L5(3), t, tt);
plot3(linex, liney, linez)
text(-0.4,-1,-2,'L5')

%Plotting L6 : 5x - 2z - 2 = 0
L6 = P61 + t*(P62-P61);
linex = subs(L6(1), t, tt);
liney = subs(L6(2), t, tt);
linez = subs(L6(3), t, tt);
plot3(linex, liney, linez)
text(-0.7,-1,-2,'L6')


%Plot Origin
scatter3(0,0,0,'.');
text(0,0,0,"Origin")

%Plotting projections of Ps:
%scatter3(Q11(1),Q11(2),Q11(3),'o');
%scatter3(Q12(1),Q12(2),Q12(3),'o');
%scatter3(Q21(1),Q21(2),Q21(3),'o');
%scatter3(Q22(1),Q22(2),Q22(3),'o');
%scatter3(Q31(1),Q31(2),Q31(3),'o');
%scatter3(Q32(1),Q32(2),Q32(3),'o');
%scatter3(Q41(1),Q41(2),Q41(3),'o');
%scatter3(Q42(1),Q42(2),Q42(3),'o');
%scatter3(Q51(1),Q51(2),Q51(3),'o');
%scatter3(Q52(1),Q52(2),Q52(3),'o');
%scatter3(Q61(1),Q61(2),Q61(3),'o');
%scatter3(Q62(1),Q62(2),Q62(3),'o');



syms c
%Plotting L_1 : Projection of line L1
L_1 = Q11 + c*(Q12-Q11);
linex = subs(L_1(1), c, -20:4);
liney = subs(L_1(2), c, -20:4);
linez = subs(L_1(3), c, -20:4);
plot3(linex, liney, linez)
text(-0.4,0.5,1,"L1'")

%Plotting L_2 : Projection of line L2
L_2 = Q21 + c*(Q22-Q21);
linex = subs(L_2(1), c, -20:4);
liney = subs(L_2(2), c, -20:4);
linez = subs(L_2(3), c, -20:4);
plot3(linex, liney, linez)
text(0,0.5,1,"L2'")

%Plotting L_3 : Projection of line L3
L_3 = Q31 + c*(Q32-Q31);
linex = subs(L_3(1), c, -3:21);
liney = subs(L_3(2), c, -3:21);
linez = subs(L_3(3), c, -3:21);
plot3(linex, liney, linez)
text(-1.611,2.833,1,"L3'")

%Plotting L_4 : Projection of line L4
L_4 = Q41 + c*(Q42-Q41);
linex = subs(L_4(1), c, -5:1);
liney = subs(L_4(2), c, -5:1);
linez = subs(L_4(3), c, -5:1);
plot3(linex, liney, linez)
text(-2.2,2.833,1,"L4'")

%Plotting L_5 : Projection of line L5
L_5 = Q51 + c*(Q52-Q51);
linex = subs(L_5(1), c, 0:8);
liney = subs(L_5(2), c, 0:8);
linez = subs(L_5(3), c, 0:8);
plot3(linex, liney, linez)
text(-0.7,2.8,1,"L5'")

%Plotting L_6 : Projection of line L6
L_6 = Q61 + c*(Q62-Q61);
linex = subs(L_6(1), c, -5:1);
liney = subs(L_6(2), c, -5:1);
linez = subs(L_6(3), c, -5:1);
plot3(linex, liney, linez)
text(-0.2,2.8,1,"L6'")

%using find_intersection to find pairwise intersection of the projected
%lines
i12 = find_intersection(Q11,Q12,Q21,Q22);
i34 = find_intersection(Q31,Q32,Q41,Q42);
i56 = find_intersection(Q51,Q52,Q61,Q62);

%showing i12, i34, i56 colinear
scatter3(i12(1),i12(2),i12(3),'*');
scatter3(i34(1),i34(2),i34(3),'*');
scatter3(i56(1),i56(2),i56(3),'*');

line([i12(1),i34(1)],[i12(2),i34(2)],[i12(3),i34(3)],'LineStyle', '--');
line([i34(1),i56(1)],[i34(2),i56(2)],[i34(3),i56(3)],'LineStyle', '--');

%joining i12, i34, i56 with origin
line([i12(1),0],[i12(2),0],[i12(3),0],'LineStyle', '--');
line([i34(1),0],[i34(2),0],[i34(3),0],'LineStyle', '--');
line([i56(1),0],[i56(2),0],[i56(3),0],'LineStyle', '--');

hold off


%print('-f1','task_D','-dpng');
