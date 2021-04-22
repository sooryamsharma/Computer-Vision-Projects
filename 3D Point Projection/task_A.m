%Defining given points
P11 = [-1,-1,2];
P12 = [-1,-1,3];
P21 = [0,-1,2];
P22 = [0,-1,3];
P31 = [1,1,2];
P32 = [1,1,3];

%Defining view point (setting azimuth and elevation)
title('Task A');
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
view([111 13])
hold on

%Defining Pi and Projection (image) Plane
[x,z] = meshgrid(-1:3,-1:3);
pi_plane = @(x,z)0*x+0*z-1;
surf(x,pi_plane(x,z),z, 'FaceColor', 'cyan', 'FaceAlpha', 0.55, 'EdgeColor', 'none');
text(2.5,-1,2.5,'\pi Plane')

hold on
[x,y] = meshgrid(-1:3,-1:3);
proj_plane = @(x,y)0*x+0*y+1;
surf(x,y,proj_plane(x,z), 'FaceColor', 'yellow', 'FaceAlpha', 0.55, 'EdgeColor', 'none');
text(1,2,1.1,'Image Plane')

%legend([h1, h2], {'Pi Plane', 'Image Plane'});
%================================================================================================
%TASK A

%Plotting origin 'O'
scatter3(0,0,0)
text(0,0,0,['O (' num2str(0) ',' num2str(0) ',' num2str(0) ')'])

%Plotting P11 projection
scatter3(P11(1),P11(2),P11(3))
Q11 = project_point(P11);
scatter3(Q11(1), Q11(2), Q11(3));
%text(Q11(1),Q11(2),Q11(3),['P11'' (' num2str(Q11(1)) ',' num2str(Q11(2)) ',' num2str(Q11(3)) ')'])
line([0,P11(1)],[0,P11(2)],[0,P11(3)]);
text(P11(1),P11(2),P11(3),['P11 (' num2str(P11(1)) ',' num2str(P11(2)) ',' num2str(P11(3)) ')'])

%Plotting P12 projection
scatter3(P12(1),P12(2),P12(3))
Q12 = project_point(P12);
scatter3(Q12(1), Q12(2), Q12(3));
%text(Q12(1),Q12(2),Q12(3),['P12'' (' num2str(Q12(1)) ',' num2str(Q12(2)) ',' num2str(Q12(3)) ')'])
line([0,P12(1)],[0,P12(2)],[0,P12(3)]);
text(P12(1),P12(2),P12(3),['P12 (' num2str(P12(1)) ',' num2str(P12(2)) ',' num2str(P12(3)) ')'])

%Plotting P21 projection
scatter3(P21(1),P21(2),P21(3))
Q21 = project_point(P21);
scatter3(Q21(1), Q21(2), Q21(3));
%text(Q21(1),Q21(2),Q21(3),['P21'' (' num2str(Q21(1)) ',' num2str(Q21(2)) ',' num2str(Q21(3)) ')'])
line([0,P21(1)],[0,P21(2)],[0,P21(3)]);
text(P21(1),P21(2),P21(3),['P21 (' num2str(P21(1)) ',' num2str(P21(2)) ',' num2str(P21(3)) ')'])

%Plotting P22 projection
scatter3(P22(1),P22(2),P22(3))
Q22 = project_point(P22);
scatter3(Q22(1), Q22(2), Q22(3));
%text(Q22(1),Q22(2),Q22(3),['P22'' (' num2str(Q22(1)) ',' num2str(Q22(2)) ',' num2str(Q22(3)) ')'])
line([0,P22(1)],[0,P22(2)],[0,P22(3)]);
text(P22(1),P22(2),P22(3),['P22 (' num2str(P22(1)) ',' num2str(P22(2)) ',' num2str(P22(3)) ')'])

%Plotting P31 projection
scatter3(P31(1),P31(2),P31(3))
Q31 = project_point(P31);
scatter3(Q31(1), Q31(2), Q31(3));
%text(Q31(1),Q31(2),Q31(3),['P31'' (' num2str(Q31(1)) ',' num2str(Q31(2)) ',' num2str(Q31(3)) ')'])
line([0,P31(1)],[0,P31(2)],[0,P31(3)]);
text(P31(1),P31(2),P31(3),['P31 (' num2str(P31(1)) ',' num2str(P31(2)) ',' num2str(P31(3)) ')'])

%Plotting P32 projection
scatter3(P32(1),P32(2),P32(3))
Q32 = project_point(P32);
scatter3(Q32(1), Q32(2), Q32(3));
%text(Q32(1),Q32(2),Q32(3),['P32'' (' num2str(Q32(1)) ',' num2str(Q32(2)) ',' num2str(Q32(3)) ')'])
line([0,P32(1)],[0,P32(2)],[0,P32(3)]);
text(P32(1),P32(2),P32(3),['P32 (' num2str(P32(1)) ',' num2str(P32(2)) ',' num2str(P32(3)) ')'])
hold off


print('-f1','task_A','-dpng');

