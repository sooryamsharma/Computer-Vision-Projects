function [Q] = project_point(P)
O = [0,0,0]; %also a point_on_line
line_vector = P - O;

point_on_plane = [0,0,1];   %[0,0,1] lies on plane
normal = [0,0,1];   %[0,0,1] is normal to the image plane

pdiff = O - point_on_plane;
prod1 = dot(pdiff, normal);
prod2 = dot(line_vector, normal);
prod3 = prod1/prod2;

Q = O - line_vector * prod3;
end

