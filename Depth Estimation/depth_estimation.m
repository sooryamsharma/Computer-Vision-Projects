%% Reading images
viewL = rgb2gray(imread('viewL.png'));
viewR = rgb2gray(imread('viewR.png'));

%% Using SSD
tStart_1 = tic();
method = "SSD";
[disp] = compute_corrs(viewL,viewR,method);
tElapsed_1 = toc(tStart_1);
disparityRange = [0 80]; 
figure(1); imshow(disp, disparityRange)
title({'Using Sum of Squared Differences',['Execution Time: ', num2str(tElapsed_1), ' sec']})
colormap jet
colorbar

%% Using Normalised cross-correlation
% tStart_2 = tic();
% method = "NCC";
% [disp] = compute_corrs(viewL,viewR,method);
% tElapsed_2 = toc(tStart_2);
% disparityRange = [0 80]; 
% figure(2); imshow(disp, disparityRange)
% title({'Using Normalized Cross Correlation',['Execution Time: ', num2str(tElapsed_2), ' sec']})
% colormap jet
% colorbar

%% Using Cross-correlation
% tStart_3 = tic();
% method = "CC";
% [disp] = compute_corrs(viewL,viewR,method);
% tElapsed_3 = toc(tStart_3);
% disparityRange = [0 80]; 
% figure(2); imshow(disp, disparityRange)
% title({'Using Cross Correlation',['Execution Time: ', num2str(tElapsed_3), ' sec']})
% colormap jet
% colorbar

%% Finding Errors
S = matfile('disparity.mat'); 
groundTruth = S.L;

error = pdist2(groundTruth,disp,'euclidean');
mean_err = mean2(error);
min_err = min(error(:));
max_err = min(error(:));
stdev_err = std2(error);