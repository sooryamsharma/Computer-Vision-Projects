function [mpts1,mpts2] = match_corners(img1,img2,pts1,pts2,WSIZE)
% mpts1 and mpts2 contain the location of the corresponding corners 
% in img1 and img2 found by computing the normalized cross correlation.

    G = fspecial('gaussian',5,1); % Gaussian blur
  	x1 = pts1(:,1);
    y1 = pts1(:,2);
    x2 = pts2(:,1);
    y2 = pts2(:,2);
    
    img1_pad = padarray(img1, [WSIZE,WSIZE]);  % Padding Img1 to later accomodate a 40x40 window around corner points
    x1 = x1 + WSIZE;  % updating the coordinates according to padding done above
    y1 = y1 + WSIZE;
    
    img2_pad = padarray(img2, [WSIZE,WSIZE]);  % Padding Img1 to later accomodate a 40x40 window around corner points
    x2 = x2 + WSIZE;  % updating the coordinates according to padding done above
    y2 = y2 + WSIZE;
    
    count = 1;
    for i = 1:length(x1)
        sample = img1_pad(y1(i)-WSIZE : y1(i)+WSIZE, x1(i)-WSIZE : x1(i)+WSIZE); % Choosing a 40x40 window around key point
        img1_blur = imfilter(sample,G); % Apply gaussian blur
        h = imresize(img1_blur,0.18,'bilinear'); % sub-sampling to reduce 41x41 to 8x8
        h = double(reshape(h,[1,64])); % Creating a 64 row/col feature vector
        img1_feturs(count,:) = (h - mean(h))/nanstd(h); % Normalizing the feature vector to zero mean and 1 std
        count = count + 1;
    end
    
    count = 1;
    for i = 1:length(x2)
        sample = img2_pad(y2(i)-WSIZE:y2(i)+WSIZE,x2(i)-WSIZE:x2(i)+WSIZE); % Choosing a 40x40 window around key point
        img2_blur = imfilter(sample,G); % Apply gaussian blur
        h = imresize(img2_blur,0.18,'bilinear'); % sub-sampling to reduce 41x41 to 8x8
        h = double(reshape(h,[1,64])); % Creating a 64 row/col feature vector
        img2_feturs(count,:) = (h - mean(h))/std(h); % Normalizing the feature vector to zero mean and 1 std
        count = count + 1;
    end

    count = 1;
    for i = 1:size(img1_feturs,1)
        s = zeros(1,size(img2_feturs,1));
        for j = 1:size(img2_feturs,1)
            s(j) = sum(sum((img1_feturs(i,:)-img2_feturs(j,:)).^2)); % Sum of square diff between features to get the best match!
        end
        [val,ind] = sort(s(:),'ascend'); % Sorting to get best one and best two.
        ratio = val(1)/val(2); % Consider it as a match if there is significant difference in best one and best two.
        if ratio < 0.3
            mpts1(count,:) = [x1(i),y1(i)]; % Making it [x,y] as showMatchedFeatures accepts this format
            mpts2(count,:) = [x2(ind(1)),y2(ind(1))]; % Making it [x,y] as showMatchedFeatures accepts this format
            count = count + 1;
        end
    end    
end

