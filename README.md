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

Synthetic population generation is the process of combining multiple socioeonomic and demographic datasets from various sources and at different granularity, and downscaling them to an individual level. Although it is a fundamental step for many data science tasks, an efficient and standard framework is absent. In this study, we propose a multi-stage framework called SynC (Synthetic Population via Gaussian Copula) to fill the gap. SynC first removes potential outliers in the data and then fits the filtered data with a Gaussian copula model to correctly capture dependencies and marginal distributions of sampled survey data. Finally, SynC leverages neural networks to merge datasets into one and then scales them accordingly to match the marginal constraints. We make four key contributions in this work: 1) propose a novel framework for generating individual level data from aggregated data sources by combining state-of-the-art machine learning and statistical techniques, 2) design a metric for validating the accuracy of generated data when the ground truth is hard to obtain, 3) demonstrate its effectiveness with the Canada National Census data and presenting two real-world use cases where datasets of this nature can be leveraged by businesses, and 4) release an easy-to-use framework implementation for reproducibility.
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

Table 2 shows an excerpt of the sampled pseudo-population with select features (due to space limitation) for one of the regions after it has been scaled to fit the marginal constraints.
![Result Table 2](https://github.com/winstonll/SynC/blob/master/figs/table2.png)

Table 3 is a comparison between a few surveyed and simulated individuals using SynC and surveyed data from selected neighbourhoods in Canada.
![Result Table 3](https://github.com/winstonll/SynC/blob/master/figs/table3.png)

## Conclusions

In this work, we propose a novel framework, SynC, for generating individual level data from aggregated data sources, using state-of-the-art machine learning and statistical methods. Additionally, we design a metric for validating the accuracy of generated data in which substantial fieldwork is required to collect the ground truth to validate the outcome using traditional methods. To show the proposed framework's effectiveness and boost reproducibility, we provide the code and data on the Canada National Census example described in Section 4. Finally, we present two real-world business use cases where datasets of this nature can be leveraged by businesses. 

As a first attempt to formalize the problem, we see three areas where future works can improve upon. First of all, our method relies on Gaussian copulas and this can be further extended by leveraging other families of copulas to better model the underlying dependency structures. Secondly, we use beta and log-normal distributions to approximate marginal distributions for categorical and continuous variables, respectively, and other families of distributions could be considered. In particular, the κ-generalized model [1] could be a better candidate for money related variables. Lastly, including more geographical features (such as city-level features, population, GDP) can potentially increase the accuracy of predicted individual level traits.

-------------

## References

[1]  Clementi, F., Gallegati, M., Kaniadakis, G., Landini, S.: κ-generalized models of income and wealth distributions. *Review Network Economics*, 225, 1959–1984 (2016)