function [TP, TN, FP, FN] = assessment(my_image, manual_image, mask_image)
% ASSESSMENT Evaluates the performance of vessel segmentation.
%
%   [TP, TN, FP, FN] = ASSESSMENT(MY_IMAGE, MANUAL_IMAGE, MASK_IMAGE) 
%   calculates the true positives (TP), true negatives (TN), false 
%   positives (FP), and false negatives (FN) by comparing the segmented 
%   image (MY_IMAGE) against a manually annotated ground truth 
%   (MANUAL_IMAGE) within a specified region of interest (MASK_IMAGE).

    % Identify true positives: correctly segmented vessels.
    tp_check = my_image & manual_image & mask_image;

    % Identify true negatives: correctly identified background regions.
    tn_check = ~my_image & ~manual_image & mask_image;

    % Identify false positives: incorrectly segmented vessels (false alarms).
    fp_check = my_image & ~manual_image & mask_image;

    % Identify false negatives: missed vessels (incorrectly identified as background).
    fn_check = ~my_image & manual_image & mask_image;

    % Sum the true positive pixels.
    TP = sum(sum(tp_check));

    % Sum the true negative pixels.
    TN = sum(sum(tn_check));

    % Sum the false positive pixels.
    FP = sum(sum(fp_check));

    % Sum the false negative pixels.
    FN = sum(sum(fn_check));

end
