function [] = SIFT_features(Ia, Ib, edgeThresh)
% convert images to grayscale
    % get features and descriptors
    [fa, da] = vl_sift(im2single(rgb2gray(Ia)), 'EdgeThresh', edgeThresh);
    [fb, db] = vl_sift(im2single(rgb2gray(Ib)), 'EdgeThresh', edgeThresh);
    
    % match the obtained SIFT features from two images
    [matches, scores] = vl_ubcmatch(da,db) ;
    
    [drop, perm] = sort(scores, 'descend') ;
    matches = matches(:, perm) ;
    scores  = scores(perm) ;

    figure; clf ;
    imagesc(cat(2, Ia, Ib)) ;

    xa = fa(1,matches(1,:)) ;
    xb = fb(1,matches(2,:)) + size(Ia,2) ;
    ya = fa(2,matches(1,:)) ;
    yb = fb(2,matches(2,:)) ;

    hold on ;
    h = line([xa ; xb], [ya ; yb]) ;
    set(h,'linewidth', 1, 'color', 'b') ;

    vl_plotframe(fa(:,matches(1,:))) ;
    fb(1,:) = fb(1,:) + size(Ia,2) ;
    vl_plotframe(fb(:,matches(2,:))) ;
    axis image off ;

end
