function H = compute_homography(mpts1,mpts2)
% compute the homography between the input images
  	x1 = mpts1(:,1);
    y1 = mpts1(:,2);
    x2 = mpts2(:,1);
    y2 = mpts2(:,2);
    
    A = zeros(length(x2(:))*2,9);
    for i = 1:length(x2(:))
        a = [x2(i),y2(i),1];
        b = [0 0 0];
        c = [x1(i);y1(i)];
        d = -c*a;
        A((i-1)*2+1:(i-1)*2+2,1:9) = [[a b;b a] d];
    end
    
    [U,S,V] = svd(A);
    h = V(:,9);
    H = reshape(h,3,3)';
end

