% Assigning points for the wireframe
P_W=[-1,-0.5, -1  ;         %P1
     -1, 0.5, -1  ;         %P2
      1, 0.5, -1  ;         %P3
      1,-0.5, -1  ;         %P4
     -1,-0.5,  1  ;         %P5
     -1, 0.5,  1  ;         %P6
      1, 0.5,  1  ;         %P7
      1,-0.5,  1  ;         %P8
     -1,   0,1.5  ;         %P9
      1,   0,1.5] ;         %P10  

figure;  draw3(P_W)     % Plotting points
title('Wireframe House'); xlabel('x-axis'); ylabel('y-axis'); zlabel('z-axis');
hold on %Origin
scatter3(0,0,0, 'x');

%================================================================================
% Defining Camera Positions
C1 = [10,10,0];
C2 = [-10,10,0];
C3 = [0,0,10];
C4 = [10,0,0];
C5 = [10,10,10];

principal = [50,50,0];  % image center

syms theta_x theta_y theta_z

%================================================================================
% Finding projections for Camera @ (i) [10, 10, 0]:
% Calculating rotation matrix
theta_x = atan2(norm(cross([0,0,1],C1)),dot([0,0,1],C1));
theta_y = atan2(norm(cross([0,1,0],C1)),dot([0,1,0],C1));
theta_z = deg2rad(0);   %atan2(norm(cross([0,0,1],(principal-C1))),dot([0,0,1],(principal-C1)));

Rx = [1 0 0; 0 cos(theta_x) -sin(theta_x); 0 sin(theta_x) cos(theta_x)];
Ry = [cos(theta_y) 0 sin(theta_y); 0 1 0; -sin(theta_y) 0 cos(theta_y)];
Rz = [cos(theta_z) -sin(theta_z) 0; sin(theta_z) cos(theta_z) 0; 0 0 1];

R = Rz*Ry*Rx;

% translation matrix will be calculated in project_points
t = C1; 

P_C = project_points(P_W,R,t);
figure; draw2(P_C)
title(strcat('Camera-1 ',mat2str(uint16(C1)))); xlabel('x-axis'); ylabel('y-axis');

%================================================================================
% Finding projections for Camera @ (ii) [-10, 10, 0]:
% Calculating rotation matrix
theta_x = atan2(norm(cross([0,0,1],C2)),dot([0,0,1],C2));
theta_y = atan2(norm(cross([0,1,0],C2)),dot([0,1,0],C2));
theta_z = deg2rad(0);   %atan2(norm(cross([0,0,1],(principal-C1))),dot([0,0,1],(principal-C1)));

Rx = [1 0 0; 0 cos(theta_x) -sin(theta_x); 0 sin(theta_x) cos(theta_x)];
Ry = [cos(theta_y) 0 sin(theta_y); 0 1 0; -sin(theta_y) 0 cos(theta_y)];
Rz = [cos(theta_z) -sin(theta_z) 0; sin(theta_z) cos(theta_z) 0; 0 0 1];

R = Rz*Ry*Rx;

% translation matrix will be calculated in project_points
t = C2; 

P_C = project_points(P_W,R,t);
figure; draw2(P_C)
title(strcat('Camera-2[-10,10,0]')); xlabel('x-axis'); ylabel('y-axis');

%================================================================================
% Finding projections for Camera @ (ii) [0, 0, 10]:
% Calculating rotation matrix
theta_x = atan2(norm(cross([0,0,1],C3)),dot([0,0,1],C3));
theta_y = deg2rad(0);
theta_z = deg2rad(0);
%atan2(norm(cross([0,0,1],(principal-C1))),dot([0,0,1],(principal-C1)));

Rx = [1 0 0; 0 cos(theta_x) -sin(theta_x); 0 sin(theta_x) cos(theta_x)];
Ry = [cos(theta_y) 0 sin(theta_y); 0 1 0; -sin(theta_y) 0 cos(theta_y)];
Rz = [cos(theta_z) -sin(theta_z) 0; sin(theta_z) cos(theta_z) 0; 0 0 1];

R = Rz*Ry*Rx;

% translation matrix will be calculated in project_points
t = C3; 

P_C = project_points(P_W,R,t);
figure; draw2(P_C)
title(strcat('Camera-3[0,0,10]')); xlabel('x-axis'); ylabel('y-axis');

%================================================================================
% Finding projections for Camera @ (ii) [10, 0, 0]:
% Calculating rotation matrix
theta_x = atan2(norm(cross([0,0,1],C4)),dot([0,0,1],C4));
theta_y = atan2(norm(cross([0,1,0],C4)),dot([0,1,0],C4));
theta_z = deg2rad(0);   %atan2(norm(cross([0,0,1],(principal-C1))),dot([0,0,1],(principal-C1)));

Rx = [1 0 0; 0 cos(theta_x) -sin(theta_x); 0 sin(theta_x) cos(theta_x)];
Ry = [cos(theta_y) 0 sin(theta_y); 0 1 0; -sin(theta_y) 0 cos(theta_y)];
Rz = [cos(theta_z) -sin(theta_z) 0; sin(theta_z) cos(theta_z) 0; 0 0 1];

R = Rz*Ry*Rx;

% translation matrix will be calculated in project_points
t = C4; 

P_C = project_points(P_W,R,t);
figure; draw2(P_C)
title(strcat('Camera-4[10,0,0]')); xlabel('x-axis'); ylabel('y-axis');

%================================================================================
% Finding projections for Camera @ (ii) [10, 10, 10]:
% Calculating rotation matrix
theta_x = atan2(norm(cross([0,0,1],C5)),dot([0,0,1],C5));
theta_y = atan2(norm(cross([0,1,0],C5)),dot([0,1,0],C5));
theta_z = deg2rad(0);

Rx = [1 0 0; 0 cos(theta_x) -sin(theta_x); 0 sin(theta_x) cos(theta_x)];
Ry = [cos(theta_y) 0 sin(theta_y); 0 1 0; -sin(theta_y) 0 cos(theta_y)];
Rz = [cos(theta_z) -sin(theta_z) 0; sin(theta_z) cos(theta_z) 0; 0 0 1];

R = Rz*Ry*Rx;

% translation matrix will be calculated in project_points
t = C5; 

P_C = project_points(P_W,R,t);
figure; draw2(P_C)
title(strcat('Camera-5[10,10,10]')); xlabel('x-axis'); ylabel('y-axis');

hold off