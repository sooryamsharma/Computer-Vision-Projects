function [] = display_res(img1,img2,pts1,pts2,WSIZE)
%Display similar points in 2 images
    figure; imshow([img1,img2]), hold on,
    plot( pts1(:,1)-WSIZE, pts1(:,2)-WSIZE, 'ys'), plot(pts2(:,1)+size(img1,2)-WSIZE, pts2(:,2)-WSIZE, 'ys'),
    title('matched corners');
    px=[(pts1(:,1)-WSIZE) (pts2(:,1)+size(img1,2)-WSIZE)];
    py=[(pts1(:,2)-WSIZE) (pts2(:,2)-WSIZE)];
    plot(px',py')
    hold off;
end

