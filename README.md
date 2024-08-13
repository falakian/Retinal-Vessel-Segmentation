# Introduction
This project focuses on developing a system to extract blood vessels from retinal images in the DRIVE (Digital Retinal Images for Vessel Extraction) dataset. Accurate extraction of blood vessels is crucial for diagnosing and researching various eye conditions, such as diabetic retinopathy. By applying advanced image processing techniques, this system aims to enhance the analysis of retinal images, providing a valuable tool for medical professionals and researchers in the field of ophthalmology.

# Steps
## Preprocessing:
* Extract Mask Image: To focus on relevant regions of interest and improve the accuracy of blood vessel extraction, we first extract a mask image. This mask highlights the area of the retina where blood vessels are expected to be found, allowing the system to concentrate its processing efforts and avoid irrelevant areas.

<div align=center>
  <table>
    <tr>
      <th>Title for Image 1</th>
      <th>Title for Image 2</th>
    </tr>
    <tr>
      <td><img src="URL_TO_IMAGE_1" alt="Description of Image 1" /></td>
      <td><img src="URL_TO_IMAGE_2" alt="Description of Image 2" /></td>
    </tr>
  </table>
</div>

* Extract Green Channel: Retinal images are typically captured in RGB format, but blood vessels are most prominently visible in the green channel. Extracting the green channel helps to enhance the visibility of blood vessels and reduce the influence of color information that is less relevant to vessel detection, leading to more accurate extraction results.

* CLAHE Contrast Enhancement: Contrast Limited Adaptive Histogram Equalization (CLAHE) is used to improve the visibility of blood vessels by enhancing the contrast of the image. CLAHE adjusts the contrast locally in different regions of the image, which helps to highlight the vessels more clearly against the background and improves the performance of subsequent vessel extraction algorithms.

<div align=center>
  <table>
    <tr>
      <th>Title for Image 1</th>
      <th>Title for Image 2</th>
    </tr>
    <tr>
      <td><img src="URL_TO_IMAGE_1" alt="Description of Image 1" /></td>
      <td><img src="URL_TO_IMAGE_2" alt="Description of Image 2" /></td>
    </tr>
  </table>
</div>


