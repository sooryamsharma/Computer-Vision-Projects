function [pts] = extract_corners(img, THRESH)
% returns the locations of all corner points in an image, img, 
% using the Harris corner detection algorithm.

    img = img(:,:,1);

    % Compute x and y derivatives of image
    [Ix,Iy] = imgradientxy(img);
    sigma = 3;
    radius = 21;
    gauss = fspecial('gaussian',max(1,fix(6*sigma)),sigma);

    % Compute products of derivatives at every pixel
    Ix2 = double(conv2(Ix.^2, gauss, 'same'));
    Iy2 = double(conv2(Iy.^2, gauss, 'same'));
    Ixy = double(conv2(Ix.*Iy, gauss, 'same'));

    [sx, sy] = size(Ix2);
    R = zeros(sy, sx);

    for i = 1:sx
        for j = 1:sy
            H = [Ix2(i,j), Ixy(i,j);
                Ixy(i,j), Iy2(i,j)];
            R(j,i) = det(H) - 0.04*(trace(H).^2);
        end
    end

    % Applying non-maximal suppression
    mask_size = 2 * radius + 1 ;   % size of the work mask
    filtered = ordfilt2 (R, mask_size ^ 2, ones (mask_size));
    % Find the local maximas
    R = (R == filtered) & (R> THRESH);
    % Point coordinates
    [Cx,Cy] = find(R);

    pts = [Cx,Cy];
    
    figure; imshow(img), hold on,
    plot(Cx, Cy, 'ys'), title('extracted corners');
    hold off;

end