# ImageRetrieval_HSV
<b>Histogram-based Color Image Retrieval in HSV color space</b>

This project targets at image retrieval issue, which is meant to find out the most 5 similar candidate photos to the given one. 
One of the most classic retrieval method is adopted, which is based on the color histogram of one specific image. 
As to the color space, we believe that histogram-based retrievals in HSV color space shows better performance than in RGB color space.
So here we only provide method implemented in HSV color space.(If you want to implement RGB method, just need some slight changes).

<br>

## File explanation

### Preprocessing
* <b>get_hist.m</b>：Calculate the histogram of all images and save to <b>hist_cell.mat</b>

### Important computings 

* <b>hist_calc.m</b>: Calculate the histogram of a picture, non-uniform quantization

* <b>hist_calc2.m</b>: Calculate the histogram of a picture and evenly quantize

* <b>dis_calc.mat</b>：Calculate the distance between histograms. 
There are choices such as Euclidean distance, histogram intersection, and Babbitt coefficient.

* <b>retrieve.m</b>：Retrieve similar images, output 11 similar images and average distance

### Data Files
* <b>Hist_cell.mat</b>：Store non-uniformly quantized histogram information for all images

* <b>Hist_cell2.mat</b>：Stores evenly quantized histogram information for all images

### Result presentation
* <b>ave_compare</b>：Compare the effects of non-uniform quantization and uniform quantization, output line graph
<br>

## Implementation

1. Before running the code, you need to put your image dataset(.jpg) into folder `image.vary.jpg`, which is in the same directory as these 
code files. More importantly, to guarantee the smoothness of these codes, you need to ensure names of these images in order, namely 
with the name of 1,2,3....

2. Run `get_hist.m` if you don't want to use our dataset(Hist_cell.mat). It may take a relatively long time to finish the process, 
especially when your dataset is very large. Besides, modify the `hist_calc` function if you want to base on the uniform quantization 
of histogram calculation with default setting being non-uniform quantization.

3. Call retrieve function `[ave_dis] = retrieve(query_img,data_option,show_option,discalc_option)`, 
example: `dis = retrieve('125.jpg',1,1,1)` ,
* <b>data_option=1 or 2</b>：Nonuniformed quantization hist or uniformed quantization hist
* <b>show_option=1 or 2</b>：whether to show the candidate images
* <b>discalc_option=1 or 2 or 3</b>：1--euclidean   2--intersection   3--Bhattacharyya
