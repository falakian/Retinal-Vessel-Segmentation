function [TP, TN, FP, FN] = assessment(my_image, manual_image,mask_image)

    tp_check = my_image & manual_image & mask_image;
    tn_check = ~my_image & ~manual_image & mask_image;
    fp_check = my_image & ~manual_image & mask_image;
    fn_check = ~my_image & manual_image & mask_image;

    TP = sum(sum(tp_check));
    TN = sum(sum(tn_check));
    FP = sum(sum(fp_check));
    FN = sum(sum(fn_check));

end
