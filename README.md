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

Synthetic population generation is the process of combining multiple socioeonomic and demographic datasets from various sources and granularity, and downscaling to an individual level. It is a fundamental step for many data science tasks with a wide range of applications. However, despite the presence of techniques such as iterative proportional fitting (IPF) and combinatorial optimization (CO), an efficient and standard framework for handling this task is absent. In this study, we propose a multi-stage framework called SynC (\textbf{Syn}thetic Population via Gaussian \textbf{C}opula) to fill the gap. SynC first removes potential outliers in the data and then fits the filtered data with a Gaussian copula model to correctly capture dependencies and marginals distributions of sampled survey data. Finally, SynC leverages neural networks to merge datasets into one and then scales them accordingly to match the marginal constraints. Our key contributions are: 1) propose a novel framework for generating individual level data from aggregated data sources by combining state-of-the-art machine learning and statistical techniques, 2) design a metric for validating the accuracy of generated data when the ground truth is hard to obtain, 3) demonstrate its effectiveness with the Canada National Census data and presenting two real-world use cases where datasets of this nature can be leveraged by businesses, and 4) release an easy-to-use framework implementation for reproducibility.

![Flowchart](https://github.com/winstonll/SynC/blob/master/figs/flowchart.png)


## Dependency
The experiment code is writen in R and built on a number of R libraries (but not limited to):
- mvtnorm
- fitdistrplus
- dplyr
- keras
- readr

All libraries are available for free on [CRAN network](https://cran.r-project.org/)

## Datasets

This study primarily uses the Canadian Nation Census Data by [Statistics Canada](https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/index.cfm?Lang=E). 
The data is accessible [here](https://figshare.com/articles/SynC_Data_Sets/7938644).

The main characteristics of the dataset can be summarised as:

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
Below is a summary of simulated data using SynC and surveyed data from selected neighbourhoods in Canada.
![Result Table](https://github.com/winstonll/SynC/blob/master/figs/results.png)


## Conclusions
In this work, we propose a novel framework, SynC, for generating individual level data from aggregated data sources, using state-of-the-art machine learning and statistical techniques. Additionally, we design a metric for validating the accuracy of generated data in which substantial fieldwork is required to collect the ground truth to validate the outcome using traditional methods. To show the proposed framework's effectiveness and boost reproducibility, we provide our code and data for the Canada National Census example from Section 4. Finally, we present two real-world business use cases where datasets of this nature can be leveraged by businesses. 