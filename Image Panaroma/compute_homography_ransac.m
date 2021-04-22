function [H,inlier1,inlier2] = compute_homography_ransac(mpts1,mpts2,tresh)
% compute the homography between the input images
    for i=1:500
        count=1;
        idx = randperm(size(mpts1,1),4); % choosing 4 random indices from the set of features in 2 imgs
        H = compute_homography(mpts2(idx,:), mpts1(idx,:)); % computing Homography based on these 4 random points
        for j=1:size(mpts1,1)
            % Calculating the new coordinates after applying the homography and then finding inliers
            [x,y] = apply_homography(H,mpts1(j,1),mpts1(j,2)); 
            d = (mpts2(j,1)-x).^2 + (mpts2(j,2)-y).^2;
            if (d < tresh)
                inlier1(count,:) = [mpts1(j,1),mpts1(j,2)];
                inlier2(count,:) = [mpts2(j,1),mpts2(j,2)];
                count=count+1;
            end
        end
    H = compute_homography(inlier2, inlier1);
end

