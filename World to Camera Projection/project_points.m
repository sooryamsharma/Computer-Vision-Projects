function [P_C] = project_points(P_W,R,t)
%{
takes as input an N x 3 vector of points with coordinates in the world frame 
and returns as output an N x 2 vector of coordinates of points in the camera 
frame. R and t are the 3 x 3 rotation and 3 x 1 translation matrices from the 
camera-centric to world frame. 
%}

% image center or principal
principal = [50,50,0];
f = norm(principal - t);    % focal length

% Converting world coordinates into homogeneous form
temp = ones(size(P_W));
P_W = [P_W, temp(:,1)];

% Translation matrix in homogeneous form
cam = t;
% T maps 3D coordinates to 3D coordinates.
T = [1,0,0,-cam(1);0,1,0,-cam(2);0,0,1,-cam(3);0,0,0,1];    

% Rotation matrix to its homogeneous form
temp = zeros(size(R));
R = [R, temp(:,1)];
R = [R; [0,0,0,1]];

% Homography matrix H
H = [-f*200,0,50,0;0,-f*200,50,0;0,0,1,0];

%==========================================================================
% Now applying the different operations:
P_Wrt = H*R*T*P_W.';
P_Wrt = P_Wrt.';

P_C = P_Wrt(:,1:2);

end