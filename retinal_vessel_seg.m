function out_image = retinal_vessel_seg(input_image, mask_image)
% RETINAL_VESSEL_SEG Segments blood vessels in retinal images.
%
%   OUT_IMAGE = RETINAL_VESSEL_SEG(INPUT_IMAGE, MASK_IMAGE) takes as input
%   a retinal image (INPUT_IMAGE) and a binary mask (MASK_IMAGE) that
%   defines the region of interest. The function processes the green
%   channel of the input image to enhance contrast, filters out noise,
%   and uses Otsu's method for thresholding. Finally, it removes small
%   regions to produce the output binary image (OUT_IMAGE) that highlights
%   the blood vessels.

    % Convert the mask image to a logical array.
    mask_image = logical(mask_image);

    % Erode the mask image using a disk-shaped structuring element of radius 3
    % to refine the region of interest.
    mask_image = imerode(mask_image, strel('disk', 3));

    % Extract the green channel from the input image, as it contains the
    % most contrast for blood vessels.
    Green_channel = input_image(:, :, 2);

    % Enhance the contrast of the green channel using adaptive histogram
    % equalization to improve visibility of the vessels.
    high_contrast = im2double(adapthisteq(Green_channel));

    % Apply the bottom-hat filter with a disk-shaped structuring element of
    % radius 6 to highlight the blood vessels.
    se = strel('disk', 6);
    image_top = imbothat(high_contrast, se);

    % Apply the mask to the filtered image to retain only the region of interest.
    image_top = image_top .* mask_image;

    % Reduce noise in the image by applying a median filter with a 3x3 kernel.
    image_top = medfilt2(image_top, [3 3]);

    % Determine the optimal threshold level using Otsu's method for binarization.
    level = graythresh(image_top);

    % Binarize the image using the calculated threshold level and apply the mask.
    Binary_image = imbinarize(image_top, level) & mask_image;

    % Remove small objects from the binary image (objects with fewer than 80 pixels)
    % to clean up the final output.
    out_image = bwareaopen(Binary_image, 80);

end
