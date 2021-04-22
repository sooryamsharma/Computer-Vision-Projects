%Defining given points
P11 = [-1,-1,2];
P12 = [-1,-1,3];
P21 = [0,-1,2];
P22 = [0,-1,3];
P31 = [1,1,2];
P32 = [1,1,3];

%Defining view point (setting azimuth and elevation)
title('Task B and C');
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
view([110 30])
hold on

%Defining Pi and Projection (image) Plane
[x,z] = meshgrid(-4:4,-3:3);
pi_plane = @(x,z)0*x+0*z-1;
surf(x,pi_plane(x,z),z, 'FaceColor', 'red', 'FaceAlpha', 0.55, 'EdgeColor', 'none');
text(3.5,-1,2.5,'\pi Plane')

[x,y] = meshgrid(-4:4,-3:3);
proj_plane = @(x,y)0*x+0*y+1;
surf(x,y,proj_plane(x,z), 'FaceColor', 'cyan', 'FaceAlpha', 0.55, 'EdgeColor', 'none');
text(1,2,1.2,'Image Plane')

%Plotting origin 'O'
scatter3(0,0,0)
text(0,0,0,['O (' num2str(0) ',' num2str(0) ',' num2str(0) ')'])

%Plotting P11 projection
scatter3(P11(1),P11(2),P11(3),'*')
Q11 = project_point(P11);
scatter3(Q11(1), Q11(2), Q11(3),'*');
text(P11(1),P11(2),P11(3),['P11 (' num2str(P11(1)) ',' num2str(P11(2)) ',' num2str(P11(3)) ')'])
line([Q11(1),P11(1)],[Q11(2),P11(2)],[Q11(3),P11(3)]);
line([Q11(1),0],[Q11(2),0],[Q11(3),0],'LineStyle', '--');

%Plotting P12 projection
scatter3(P12(1),P12(2),P12(3),'*')
Q12 = project_point(P12);
scatter3(Q12(1), Q12(2), Q12(3),'*');
text(P12(1),P12(2),P12(3),['P12 (' num2str(P12(1)) ',' num2str(P12(2)) ',' num2str(P12(3)) ')'])
line([Q12(1),P12(1)],[Q12(2),P12(2)],[Q12(3),P12(3)]);
line([Q12(1),0],[Q12(2),0],[Q12(3),0],'LineStyle', '--');

%Plotting P21 projection
scatter3(P21(1),P21(2),P21(3),'*')
Q21 = project_point(P21);
scatter3(Q21(1), Q21(2), Q21(3),'*');
text(P21(1),P21(2),P21(3),['P21 (' num2str(P21(1)) ',' num2str(P21(2)) ',' num2str(P21(3)) ')'])
line([Q21(1),P21(1)],[Q21(2),P21(2)],[Q21(3),P21(3)]);
line([Q21(1),0],[Q21(2),0],[Q21(3),0],'LineStyle', '--');

%Plotting P22 projection
scatter3(P22(1),P22(2),P22(3),'*')
Q22 = project_point(P22);
scatter3(Q22(1), Q22(2), Q22(3),'*');
text(P22(1),P22(2),P22(3),['P22 (' num2str(P22(1)) ',' num2str(P22(2)) ',' num2str(P22(3)) ')'])
line([Q22(1),P22(1)],[Q22(2),P22(2)],[Q22(3),P22(3)]);
line([Q22(1),0],[Q22(2),0],[Q22(3),0],'LineStyle', '--');

%Plotting P31 projection
scatter3(P31(1),P31(2),P31(3),'*')
Q31 = project_point(P31);
scatter3(Q31(1), Q31(2), Q31(3),'*');
text(P31(1),P31(2),P31(3),['P31 (' num2str(P31(1)) ',' num2str(P31(2)) ',' num2str(P31(3)) ')'])
line([Q31(1),P31(1)],[Q31(2),P31(2)],[Q31(3),P31(3)]);
line([Q31(1),0],[Q31(2),0],[Q31(3),0],'LineStyle', '--');

%Plotting P32 projection
scatter3(P32(1),P32(2),P32(3),'*')
Q32 = project_point(P32);
scatter3(Q32(1), Q32(2), Q32(3),'*');
text(P32(1),P32(2),P32(3),['P32 (' num2str(P32(1)) ',' num2str(P32(2)) ',' num2str(P32(3)) ')'])
line([Q32(1),P32(1)],[Q32(2),P32(2)],[Q32(3),P32(3)]);
line([Q32(1),0],[Q32(2),0],[Q32(3),0],'LineStyle', '--');

%finding intersection of the projected points
%for L1 and L2
p11=project_point(P11);
p12=project_point(P12);
p21=project_point(P21);
p22=project_point(P22);
Q_1_2 = find_intersection(p11,p12,p21,p22);
scatter3(Q_1_2(1),Q_1_2(2),Q_1_2(3), 'o');
line([Q11(1),Q_1_2(1)],[Q11(2),Q_1_2(2)],[Q11(3),Q_1_2(3)]);
line([Q21(1),Q_1_2(1)],[Q21(2),Q_1_2(2)],[Q21(3),Q_1_2(3)]);

%for L2 and L3
p21=project_point(P21);
p22=project_point(P22);
p31=project_point(P31);
p32=project_point(P32);
Q_2_3 = find_intersection(p21,p22,p31,p32);
scatter3(Q_2_3(1),Q_2_3(2),Q_2_3(3), 'o');
line([Q21(1),Q_2_3(1)],[Q21(2),Q_2_3(2)],[Q21(3),Q_2_3(3)]);
line([Q31(1),Q_2_3(1)],[Q31(2),Q_2_3(2)],[Q31(3),Q_2_3(3)]);


hold off


text(0,0,1,'Q'' (0,0,1)')
%print('-f1','task_BC','-dpng');
