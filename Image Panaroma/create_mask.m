function [mask1,mask2] = create_mask(img1)
    v=230;
    mask1 = zeros(size(img1));
    mask1(:,1:v,:) = 1;
    mask2 = 1-mask1;
    blurh = fspecial('gauss',30,15); % feather the border
    mask1 = imfilter(mask1,blurh,'replicate');
    mask2 = imfilter(mask2,blurh,'replicate');
end

