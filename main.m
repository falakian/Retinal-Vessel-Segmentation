clc;
clear;
close all;

% Path of images
test_images_path = './DRIVE/Test/images/';
test_mask_path = './DRIVE/Test/mask/';
test_1st_manual_path = './DRIVE/Test/1st_manual/';
path_of_report = './report/';

all_test_images = dir(test_images_path);

Number_all_test_images = size(all_test_images,1);

sum_of_Sensitivity = 0;
sum_of_Specificity = 0;
sum_of_Accuracy = 0;
Number_of_images_processed = 0;

% The first record of the report file
data_excel(1,:) = {'Image number','Sensitivity','Specificity', 'Accuracy'};

for i=1:Number_all_test_images

    if(all_test_images(i).isdir == 1)
        continue;
    end

    image_path = all_test_images(i).folder + "/" + all_test_images(i).name;
    name_split = string(all_test_images(i).name).split('_');
    Number_of_images = name_split(1);

    mask_path = test_mask_path + Number_of_images + "_test_mask.gif";
    manual_image_path = test_1st_manual_path + Number_of_images + "_manual1.gif";
    
    input_image = im2double(imread(image_path));
    mask_image = im2double(imread(mask_path));
    manual_image = im2double(imread(manual_image_path));

    % Extraction of vessels
    extracted_image = retinal_vessel_seg(input_image, mask_image);
    
    % Performance evaluation criteria
    [TP, TN, FP, FN] = assessment(extracted_image, manual_image ,mask_image);

    Sensitivity = TP / (TP + FN);
    Specificity = TN / (TN + FP);
    Accuracy =  (TP + TN) / (TP + TN + FP + FN);

    sum_of_Sensitivity = sum_of_Sensitivity + Sensitivity;
    sum_of_Specificity = sum_of_Specificity + Specificity;
    sum_of_Accuracy = sum_of_Accuracy + Accuracy;
    
    [height , width] = size(extracted_image);
    
    % Red color: the extracted vessels
    % Green color: main vessels
    % Yellow color: the vessels that are correctly detected
    assessment_image = zeros(height ,width, 3);
    assessment_image(:, : , 1) = extracted_image;
    assessment_image(:, : , 2) = manual_image;
    
    % Save the assessment in the report file
    data_excel(size(data_excel ,1) + 1,:) = {Number_of_images , Sensitivity, Specificity, Accuracy};
    Number_of_images_processed = Number_of_images_processed + 1;

    % Save the image of the assessment
    imwrite(assessment_image , [path_of_report + Number_of_images + '_report.png']);
end

% Calculation of average evaluation
avg_sensitivity = sum_of_Sensitivity / Number_of_images_processed;
avg_specificity = sum_of_Specificity / Number_of_images_processed;
avg_accuracy = sum_of_Accuracy / Number_of_images_processed;

data_excel(size(data_excel ,1) + 1,:) = {"Average : ", avg_sensitivity, avg_specificity, avg_accuracy};
% Save the report file
xlswrite(strcat(path_of_report , 'report.xlsx'), data_excel);