## Objectives:

### (Task A)	

Write a MATLAB function, Q = project point(P) that computes the projection Q on the image plane of a given point P.
Apply this function to each of the given points (i.e. P11, P12, P21, P22, P31 and P32).
    
The projected points Q11, Q12, Q21, Q22, Q31 and Q32 for the given points P11, P12, P21, P22, P31 and P32 keeping center of at the Origin ‘O’ are as follows:

![points](images/Picture0.png)

### (Sol. A)

![Task A](images/Picture1.png)

-------------------------------------------------------------------------------------------------------------------------------------------

### (Task B)	

Q = find intersection (P11, P12, P21, P22) that takes as input two points from each line, L1 and L2, and computes the point of intersection Q of the lines projected on the image plane. 
Plot the given lines, their projections, and the point of intersection using MATLAB visualization functions.

### (Sol. B)

![Task B](images/Picture2.png)

-------------------------------------------------------------------------------------------------------------------------------------------

### (Task C) 

Verify that the point of intersection for each pair of parallel lines L1, L2, and L3 is the same by applying the find intersection function to each pair.

### (Sol. C)

Yes, we get the same point Q’ i.e. (0,0,1), evident from the above figure.

-------------------------------------------------------------------------------------------------------------------------------------------

### (Task D) 

Consider three pairs of parallel lines on the plane π given by the following: \
(i) x - 1 = 0 and x = 0, \
(ii) 3x + 2z - 1 = 0 and 3x + 2z - 2 = 0, \
(iii) 5x - 2z - 1 = 0 and 5x - 2z - 2 = 0. \
Determine the point of intersection for each pair. Verify that the three points found are collinear. 

### (Sol. D)

![Task D](images/Picture3.png)

Let, \
L1: x – 1 = 0  ||  L2: x = 0, \
L3: 3x + 2z – 1 = 0  || L4: 3x + 2z – 2 = 0 and \
L5: 3x + 2z – 2 = 0  || L6: 5x – 2z – 1 = 0 

So, when we project these pair of parallel lines, i.e. L1 || L2, L3 || L4 and L5 || L6, onto the image-plane we get the following lines, namely L1’, L2’, L3’, L4’, L5’ and L6’ respectively. 

Now we find the pair-wise intersection of L1’ & L2’, L3’ & L4’ and L5’ and L6’. As shown in the above diagram. Intersection is shown with ‘*’. 

We get three co-linear points, viz 

From intersection of L1’ and L2’ we get the point (0, 0, 1), 

From intersection of L3’ and L4’ we get the point (-0.667, 0, 1) and 

From intersection of L5’ and L6’ we get the point (0.4, 0, 1). 

And these three points are co-linear on the image-plane.

-------------------------------------------------------------------------------------------------------------------------------------------
