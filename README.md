# visual-difference
Docker image for visual regression tests

After extensive testing, I found DSSIM & ꟻLIP to be the most accurate
metrics for comparing images (at least for my specific needs).

By using both tools I can improve accuracy & minimize errors.
Since there's no Docker image with ꟻLIP, I decided to provide my own.

> **NOTE** ꟻLIP source files are taken from Nvidia's website https://research.nvidia.com/sites/default/files/pubs/2020-07_FLIP/flip-cpp.zip.
> 
>I am not the creator of this fantastic image evaluator.  
