function blend = blend_images(img1,img2,mask1,mask2)
% After estimating the homography between two images, they can be stitched 
% together using Laplacian pyramid blending.
    img1 = im2double(img1);
    img2 = im2double(img2);
    img1 = imresize(img1,[size(img2,1) size(img2,2)]);
    [M, N, ~] = size(img1);
      
    blurh = fspecial('gauss',30,15); % feather the border
    
    % Generate Gaussian pyramid for both the images and mask
    lpyr1 = LoG_Pyramid(img1, 5);
    lpyr2 = LoG_Pyramid(img2, 5);
       
    blend = cell(1,5); % the blended pyramid
    for p = 1:5
        [Mp, Np, ~] = size(lpyr1{p});
        mask1p = imresize(mask1,[Mp Np]);
        mask2p = imresize(mask2,[Mp Np]);
        blend{p} = lpyr1{p}.*mask1p + lpyr2{p}.*mask2p;
    end
    blend = pyrReconstruct(blend);
    figure,imshow(blend) % blend by pyramid
end

