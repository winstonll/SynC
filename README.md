# SynC: A Unified Framework for Generating Synthetic Population with Gaussian Copula

------------

Wan, C., Li, Z., and Zhao, Y., "SynC: A Unified Framework for Generating Synthetic Population with Gaussian 
Copula," *Joint European Conference on Machine Learning and Knowledge Discovery in Databases (ECML-PKDD)*, 2019. 
**Submitted, under review**.

<!-- Please cite the paper as (only if we submit an arxiv):

    @inproceedings{wan2018sythetic,
      title={SynC: A Unified Framework for Generating Synthetic Population with Gaussian Copula},
      author={Wan, C. and Li, Z. and Zhao, Y.},
      journal={arXiv preprint arXiv:1901.01588},
      year={2019},
      url={https://arxiv.org/abs/1901.01588}
    }
    
 [PDF for Personal Use](http://arxiv.org/abs/1901.04555) | [ECML-PKDD 2019](http://www.ecmlpkdd2019.org/) -->
 
 
------------


## Introduction

Generating synthetic population data from multiple raw data
sources is a fundamental step for many data science tasks with a wide
range of applications. However, despite the presence of a number of ap-
proaches such as iterative proportional fitting (IPF) and combinatorial
optimization (CO), an efficient and standard framework for handling this
type of problems is absent. In this study, we propose a multi-stage frame-
work called SynC (short for Synthetic Population via Gaussian Copula)
to fill the gap. SynC first removes potential outliers in the data and then
fits the filtered data with a Gaussian copula model to correctly capture
dependencies  and  marginals  distributions  of  sampled  survey  data.  Fi-
nally, SynC leverages neural networks to merge datasets into one. Our
key contributions include: 1) propose a novel framework for generating
individual level data from aggregated data sources by combining state-of-
the-art machine learning and statistical techniques, 2) design a metric for
validating the accuracy of generated data when the ground truth is hard
to obtain, 3) release an easy-to-use framework implementation for repro-
ducibility  and  demonstrate  its  effectiveness  with  the  Canada  National
Census data, and 4) present two real-world use cases where datasets of
this nature can be leveraged by businesses.

![Flowchart](https://flowchart.png)


## Dependency
The experiment code is writen in R and built on a number of R libraries (but not limited to):
- mvtnorm
- fitdistrplus
- dplyr
- keras
- readr
All libraries are available for free on [CRAN network](https://cran.r-project.org/)

## Datasets

This study primarily uses the Canadian Nation Census Data by Statistics Canada [1]. 
The data is accessible at https://xxx/.

The main characteristics of the dataset can be summarized as:

|Property           | Value   |
|-------------------|---------|
|# of Postal Codes  | 793,815 |
|# of Variables     | 4,000+  |
|Sampling level     | Postal  |
|Year of Census     | 2016    |


## Usage

To re-create experimental results:

- Update synthetic_population.R with the desired Postal Codes and the location of the data files
- Specify the variables of interest. In the example, we provided two examples of generating ethnicity
and religion.


## Results

Copy some key results here.


## Conclusions
In this work, we propose a novel framework for generating individual level data
from  aggregated  data  sources  using  state-of-the-art  data  mining  and  machine
learning techniques and design a metric for validating the accuracy of generated
data in which substantial field work is required to collect the ground truth to
validate  the  outcome  using  traditional  methods.  We  also  create  a  toolbox  for
generating  synthetic  population  data  using  the  Canada  National  Census  data
and present two real-world business use cases where datasets of this nature can
be leveraged by businesses.
As a first attempt to formalise the problem, we see three areas where future
works can improve upon. First of all, our method replies on Gaussian copulas
and this can be further extended by leveraging other families of copulas for bet-
ter  modeling  of  the  underlying  dependency  structures.  Secondly,  we  use  beta
distributions and log-normal distributions to model marginal distributions for
probabilities  and  continuous  variables,  respectively,  and  other  families  of  dis-
tributions could be considered. In particular, the κ-generalized model [5] could
be a better candidate for money related variables. Lastly, one could try to in-
clude more geographical features (such as city-level location, population, GDP
to increase the accuracy of predicted individual level traits.


## References

[1] Data source XXX