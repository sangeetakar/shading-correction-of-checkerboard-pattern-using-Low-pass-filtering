g = imread('checkerboard1024-shaded.tif'); % Shaded image
subplot(1,3,1);
imshow(g);
title('Original Shaded Image')

% Convert to double precision (if needed)
if ~isa(g, 'double')
  g = double(g);
end

% Estimate the shading function using a low-pass filter
sigma = 55;
h_estimated = imgaussfilt(g, sigma);
shade = uint8(h_estimated)

% Correct the shading by dividing the shaded image by the estimated shading function
correctedImage = g ./ h_estimated;

% Display the corrected image


subplot(1,3,2);
imshow(h_estimated,[]);
title('Shade Image')

subplot(1,3,3);
imshow(correctedImage,[]);
title('Corrected Image')

imwrite(correctedImage,'result.png')