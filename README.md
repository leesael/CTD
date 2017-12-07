# CTD: Fast, Accurate, and Interpretable Method for Static and Dynamic Tensor Decompositions

## Overview
How can we find patterns and anomalies in a tensor, or multi-dimensional array, in an efficient and directly interpretable way? How can we do this in an online environment, where a new tensor arrives each time step? Finding patterns and anomalies in a tensor is a crucial problem with many applications, including building safety monitoring, patient health monitoring, cyber security, terrorist detection, and fake user detection in social networks. Standard PARAFAC and Tucker decomposition results are not directly interpretable. Although a few sampling-based methods have previously been proposed towards better interpretability, they need to be made faster, more memory efficient, and more accurate. 

In this paper, we propose CTD, a fast, accurate, and directly interpretable tensor decomposition method based on sampling. CTD-S, the static version of CTD, provably guarantees a high accuracy that is up to 11x more accurate than that of the state-of-the-art method experimentally. Also, CTD-S is made up to 2.3x faster, and up to 24x more memory-efficient than the state-of-the-art method by removing redundancy. CTD-D, the dynamic version of CTD, is the first interpretable dynamic tensor decomposition method ever proposed. Also, it is made up to 82x faster than already fast CTD-S by exploiting factors at previous time step and by reordering operations. With CTD, we demonstrate how the results can be effectively interpreted in the online distributed denial of service (DDoS) attack detection and online troll detection.

## Paper
**CTD: Fast, Accurate, and Interpretable Method for Static and Dynamic Tensor Decompositions**  
Jungwoo Lee, Dongjin Choi, and U Kang.  
[[pdf](/paper.pdf)]

## Code
The source codes used in the paper are available. 
* CTD-v1.0: [[download](/code/)]

## Comparison
Comparison of our proposed CTD and the existing tensor-CUR. The static method CTD-S outperforms the state of-the-art tensor-CUR in terms of time, memory usage, and accuracy. The dynamic method CTD-D is the fastest. 

|  | Tensor-CUR (Existing) | **CTD-S [Proposed]** | **CTD-D [Proposed]** |
| :------------------: | :--------------: | :--------------: | :--------------: |
| Interpretability | O | O | O |
| Time | Fast | Faster | **Fastest** |
| Memory Usage | Low | **Lower** | Low |
| Accuracy | Low | **High** | **High** |
| Online | | | O |


## Dataset
| Name | Structure | Size | Nonzero | Download |
| :---------------: | :---------------: | :------------------: | :---------: | :---------: |
| [Facebook-wall](http://socialnetworks.mpi-sws.org/data-wosn2009.html) | User 1 - User 2 - Time | 63,891 &times; 63,890 &times; 1,504 | 738,485 | [[Down](/data/Facebook_wall/facebook_wall_tensor.mat)] |
| Facebook-wall (synthetic) | User 1 - User 2- Time | 63,891 &times; 63,890 &times; 1,504 | 1,169,656 | [[Down](/data/Facebook_wall/facebook_wall_tensor_synthetic.mat)] |
| [Hyperspectral Image](http://www.imageval.com/scene-database-4-faces-3-meters/) | X - Y - Frequency | 538 &times; 323 &times; 148 | 25,715,854 | [[Down](https://datalab.snu.ac.kr/data/CTD/HyperspectralImage.zip)] |
| [Infectious](http://konect.uni-koblenz.de/networks/sociopatterns-infectious) | Person 1 - Person 2 - Time | 407 &times; 410 &times; 1,392 | 17,298 | [[Down](/data/Infectious/infectious.mat)] |
| [Hypertext 2009](http://www.sociopatterns.org/datasets/hypertext-2009-dynamic-contact-network/) | Attendee 1 - Attendee 2 - Time | 112 &times; 113 &times; 5,246 | 20,818 | [[Down](/data/Hypertext_2009/hypertext_2009.mat)] |
| [Haggle](http://konect.uni-koblenz.de/networks/contact) | Person 1 - Person 2 - Time | 77 &times; 274 &times; 1,567 | 27,972 | [[Down](/data/Haggle/haggle.mat)] |
| [CAIDA](http://www.caida.org/data/CAIDA) | Source IP - Destination IP - Time | 189 &times; 189 &times; 1,000 | 20,511 | [[Down](/data/CAIDA/CAIDA_part.mat)] |
| CAIDA | Source IP - Destination IP - Time | 189 &times; 189 &times; 1,000 | 46,102 | [[Down](/data/CAIDA/CAIDA_part_synthetic.mat)] |

## People
[Jungwoo Lee](http://datalab.snu.ac.kr/~ljw9111/) (Seoul National University)  
[Dongjin Choi](http://datalab.snu.ac.kr/~skywalker5) (Seoul National University)  
[Lee Sael](http://www3.cs.stonybrook.edu/~sael/) (SUNY Korea)