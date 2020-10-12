# visual-difference
Docker image for visual regression tests

After extensive testing, I found DSSIM & ꟻLIP to be the most accurate
metrics for comparing images (at least for my specific needs).

By using both tools I can improve accuracy & minimize errors.
Since there's no Docker image with ꟻLIP, I decided to provide my own.

> **NOTE** ꟻLIP source files are taken from Nvidia's website https://research.nvidia.com/sites/default/files/pubs/2020-07_FLIP/flip-cpp.zip.
> 
>I am not the creator of this fantastic image evaluator.  


## Usage for ꟻLIP:

```
flip <reference.{jpg|png}> <test.{jpg|png}> [options]

Options:
     -help                     #  Show this text
     -v <[0-2}>                #  Verbosity: 0 = silent, 1 = pooled values (default), >1 = verbose
     -heatmap <heatmap.png>    #  Generate heatmap image
     -nomagma                  #  Grayscale (FLIP values) instead of Magma heatmap (with "-heatmap")
     -histogram <filename>     #  Pooling output (<filename>.csv and <filename>.py files generated)
     -log                      #  Log10 on y-axis in the Python pooling histogram (with "-histogram").

0 - images are the same
1 (?) - images are completely different
