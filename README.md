# XXXX: Population Sythesis via xxxx

------------

(First Author), (Second Author) and (Third Author), "XXXX: Population Sythesis via xxxx," 
*Joint European Conference on Machine Learning and Knowledge Discovery in Databases (ECML-PKDD)*, 2019. 
**Submitted, under review**.

Please cite the paper as (only if we submit an arxiv):

    @inproceedings{wan2018sythetic,
      title={XXXX: Population Sythesis via xxxx},
      author={xxx},
      journal={arXiv preprint arXiv:1901.01588},
      year={2019},
      url={https://arxiv.org/abs/1901.01588}
    }
    
 [PDF for Personal Use](http://arxiv.org/abs/1901.04555) | [ECML-PKDD 2019](http://www.ecmlpkdd2019.org/)
 
 
------------


## Introduction

Copy our finalized introduction here

![Flowchart](https://flowchart.png)


## Dependency
The experiment code is writen in R and built on a number of R libraries (but not limited to):
- mvtnorm
- fitdistrplus
- dplyr
- keras
- readr


## Datasets

This study primarily uses the Canadian Nation Census Data by Statistics Canada [1]. 
The data is accessible at https://xxx/.

The main characteristics of the dataset can be summarized as:

***Fix below***

|Property           | Value   |
|-------------------|---------|
|# of Postal Codes  | 793,815 |
|# of Variables     | 4,000+  |
|Sampling level     | Postal  | 


## Usage

To re-create experimental results:

- Update synthetic_population.R with the desired Postal Codes and the location of the data files
- Specify the variables of interest. In the example, we provided two examples of generating ethnicity
and religion.


## Results

Copy some key results here.


## Conclusions
Copy the conclusion here.


## References

[1] Data source XXX