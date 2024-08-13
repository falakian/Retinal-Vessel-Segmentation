# Introduction
This project focuses on developing a system to extract blood vessels from retinal images in the DRIVE (Digital Retinal Images for Vessel Extraction) dataset. Accurate extraction of blood vessels is crucial for diagnosing and researching various eye conditions, such as diabetic retinopathy. By applying advanced image processing techniques, this system aims to enhance the analysis of retinal images, providing a valuable tool for medical professionals and researchers in the field of ophthalmology.

# Steps
## Preprocessing:
* Extract Mask Image: To focus on relevant regions of interest and improve the accuracy of blood vessel extraction, we first extract a mask image. This mask highlights the area of the retina where blood vessels are expected to be found, allowing the system to concentrate its processing efforts and avoid irrelevant areas.

<div align=center>
  <table>
    <tr>
      <th>Orginal Image</th>
      <th>Mask Image</th>
    </tr>
    <tr>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/orginal_image.png" alt="Orginal Image" /></td>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/01_test_mask.gif" alt="Mask Image" /></td>
    </tr>
  </table>
</div>

* Extract Green Channel: Retinal images are typically captured in RGB format, but blood vessels are most prominently visible in the green channel. Extracting the green channel helps to enhance the visibility of blood vessels and reduce the influence of color information that is less relevant to vessel detection, leading to more accurate extraction results.

* CLAHE Contrast Enhancement: Contrast Limited Adaptive Histogram Equalization (CLAHE) is used to improve the visibility of blood vessels by enhancing the contrast of the image. CLAHE adjusts the contrast locally in different regions of the image, which helps to highlight the vessels more clearly against the background and improves the performance of subsequent vessel extraction algorithms.

<div align=center>
  <table>
    <tr>
      <th>Green Channel</th>
      <th>CLAHE Contrast</th>
    </tr>
    <tr>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/1_green_channel.png" alt="Green Channel" /></td>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/2_high_contrast.png" alt="CLAHE Contrast" /></td>
    </tr>
  </table>
</div>

* Bottom-Hat Transform: The Bottom-Hat Transform is used to highlight dark structures (such as blood vessels) in a bright background. This operation enhances the visibility of fine details in the image that might otherwise be overlooked by other techniques. We perform this step to effectively separate the dark blood vessels from the bright background, which is crucial for accurate extraction.

* Noise Removal (Using 3x3 Median Kernel): Noise Removal using a 3x3 median filter is essential to improve image quality and reduce errors caused by noise in subsequent processing steps. In digital images, noise can degrade the quality and cause inaccuracies in analysis. The median filter helps to reduce salt-and-pepper noise while preserving edges, leading to a smoother image and better results in blood vessel extraction.

<div align=center>
  <table>
    <tr>
      <th>Bottom-Hat</th>
      <th>Noise Removal</th>
    </tr>
    <tr>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/3_image_top.png" alt="Bottom-Hat" /></td>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/4_reduce_noise.png" alt="Noise Removal" /></td>
    </tr>
  </table>
</div>

## Vessel Extraction:

* Otsu Thresholding: Otsu Thresholding is an automated technique for converting a grayscale image to a binary image by determining the optimal threshold to separate the object (blood vessels) from the background. This step is critical because it enables accurate segmentation of the blood vessels without requiring manual threshold selection, thus improving the precision of vessel extraction.

* Remove Small Regions
The step Remove Small Regions involves eliminating small, scattered areas that are likely to be noise or irrelevant details. After thresholding, there may be small, noisy regions that do not correspond to blood vessels. By removing these small regions, the final image is cleaner, retaining only the primary blood vessels, which enhances the accuracy and reduces the complexity of subsequent analysis.

<div align=center>
  <table>
    <tr>
      <th>Otsu Thresholding</th>
      <th>Remove Small Regions</th>
    </tr>
    <tr>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/5_Binary_image.png" alt="Otsu Thresholding" /></td>
      <td><img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/6_out_image.png" alt="Remove Small Regions" /></td>
    </tr>
  </table>
</div>

## Compare my result and ground truth:
* Green: The right vessels were not detected
* Red: Misdiagnosed vessels
* Yellow: Vessels that are correctly identified
  
<p align=center>
<img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/report/01_report.png">
</p>

## Final Results
My results for 20 test images:

<p align=center>
<img src="https://github.com/falakian/Retinal-Vessel-Segmentation/blob/main/Step-by-step%20images/result.png">
</p>
