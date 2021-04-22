
img=imread('lines.jpg');
gray=rgb2gray(img);
bw=edge(gray, 'sobel');

[row,col] = find(bw); 

map(-418,-45)
   
accum=zeros(1500,200);
rho2=zeros(4006,180);
theta1=-90:1:89;

for x=1:length(row)
    disp(x)
        for theta=-90:1:89
            rho=col(x)*cosd(theta)+row(x)*sind(theta);
            rho2(x,theta+91)=rho;
            params=map(rho,theta);
            accum(params(1),params(2))=accum(params(1),params(2))+1;

        end
end

    max_accum = accum;
    max_accum(accum < 125) = 0;
max_accum=imregionalmax(max_accum);
figure, imshow(max_accum)

[row1,col1]=find(max_accum);
figure, imshow(bw);
hold on

for i=1:length(row1)
   re=remap(row1(i),col1(i));
   x1 = 0:1000;
   y1 = (re(1) - x1* cosd(re(2)) )/ sind(re(2));
   line(x1,y1,'Color','red');
   hold on
end
  
   function h1=map(rho,theta)
   rho1=(rho-(-645))* (1430-1)/(785.74-(-645))+1;
   theta1=(theta-(-90))*(180-1)/(90-(-90))+1;
   result=[rho1,theta1,theta];
   h1=round(result);

   end
   
   function h2=remap(rho,theta)
   rho1=(rho-1)* (784.74-(-645))/(1430-1)+(-645);
   theta1=(theta-1)*(90-(-90))/(180-1)+(-90);
   result=[rho1,theta1,theta];
   h2=round(result);

   end