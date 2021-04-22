function draw3(M)

%Plotting the vertices
scatter3(M(:,1), M(:,2), M(:,3), '.');
%Origin

%Plotting lines
line([M(1,1),M(2,1)],[M(1,2),M(2,2)],[M(1,3),M(2,3)],'Color','red') %P1-P2
line([M(2,1),M(3,1)],[M(2,2),M(3,2)],[M(2,3),M(3,3)],'Color','red') %P2-P3
line([M(3,1),M(4,1)],[M(3,2),M(4,2)],[M(3,3),M(4,3)],'Color','red') %P3-P4
line([M(4,1),M(1,1)],[M(4,2),M(1,2)],[M(4,3),M(1,3)],'Color','red') %P4-P1

line([M(1,1),M(5,1)],[M(1,2),M(5,2)],[M(1,3),M(5,3)],'Color','blue') %P1-P5
line([M(2,1),M(6,1)],[M(2,2),M(6,2)],[M(2,3),M(6,3)],'Color','blue') %P2-P6
line([M(3,1),M(7,1)],[M(3,2),M(7,2)],[M(3,3),M(7,3)],'Color','blue') %P3-P7
line([M(4,1),M(8,1)],[M(4,2),M(8,2)],[M(4,3),M(8,3)],'Color','blue') %P4-P8

line([M(5,1),M(6,1)],[M(5,2),M(6,2)],[M(5,3),M(6,3)],'Color','green') %P5-P6
line([M(6,1),M(7,1)],[M(6,2),M(7,2)],[M(6,3),M(7,3)],'Color','green') %P6-P7
line([M(7,1),M(8,1)],[M(7,2),M(8,2)],[M(7,3),M(8,3)],'Color','green') %P7-P8
line([M(8,1),M(5,1)],[M(8,2),M(5,2)],[M(8,3),M(5,3)],'Color','green') %P8-P5

line([M(5,1),M(9,1)],[M(5,2),M(9,2)],[M(5,3),M(9,3)],'Color','black') %P5-P9
line([M(6,1),M(9,1)],[M(6,2),M(9,2)],[M(6,3),M(9,3)],'Color','black') %P6-P9
line([M(7,1),M(10,1)],[M(7,2),M(10,2)],[M(7,3),M(10,3)],'Color','black') %P7-P10
line([M(8,1),M(10,1)],[M(8,2),M(10,2)],[M(8,3),M(10,3)],'Color','black') %P8-P10

line([M(9,1),M(10,1)],[M(9,2),M(10,2)],[M(9,3),M(10,3)],'Color','black') %P9-P10

end