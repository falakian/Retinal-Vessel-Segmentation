
function out_image = retinal_vessel_seg(input_image, mask_image)

% Convert the mask image to a logical array.
mask_image = logical(mask_image);

% Erode the mask image with a disk-shaped structuring element of radius 3.
mask_image = imerode(mask_image, strel('disk',3));

% Extract the green channel from the input image.
Green_channel = input_image(:,:,2);

% Enhance the contrast of the green channel using adaptive histogram equalization.
high_contrast = im2double(adapthisteq(Green_channel));

% Apply the bottom-hat filter to the high contrast image to highlight vessels.
se = strel('disk',6);
image_top = imbothat(high_contrast,se);

% Apply the mask to the filtered image to keep only the region of interest.
image_top = image_top .* mask_image;

% Apply a median filter to reduce noise in the image.
image_top = medfilt2(image_top,[3 3]);

% Determine an optimal threshold level using Otsu's method.
level = graythresh(image_top);

% Binarize the image using the threshold level and apply the mask.
Binary_image = imbinarize(image_top,level) & mask_image;

% Remove small objects from the binary image (objects with fewer than 80 pixels).
out_image = bwareaopen(Binary_image,80);

end
