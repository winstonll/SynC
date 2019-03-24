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
- lib1
- lib2
- lib2


## Datasets

This study primarily uses the **XXX** dataset by **XXX** [1]. The data is accessible at https://xxx/.

The main characteristics of the dataset can be summarized as:

***Fix below***

|Property           | Value   |
|-------------------|---------|
|# of Tracks        | 1,413   |
|# of Artists       | 20      |
|Albums per Artist  | 6       | 
|Bitrate            | 32 kbps |
|Sample Rate        | 16 kHz  |
|Channels           | Mono    |


## Usage

To re-create experimental results:

- Prepare mel-scaled spectrograms from raw audio in the dataset.
    - Run src/utility.py if the dataset is stored using its original folder structure (artists/[artist]/[album]/[song].mp3) in the project root.
    - Using the create_dataset() utility function in src/utility.py with a custom directory if the dataset is stored elsewhere.
- Run the main.py script. This will begin a training loop which runs three independent trials for each audio length in {1s, 3s, 5s, 10s, 20s, 30s}.
    - This script must be adjusted manually to vary whether or not to use an album split via the album_split flag in the train_model function call. 
    - It should be noted that training each model is computationally expensive and can take several hours even with reliable hardware. At minimum, a Nvidia GTX 1080 GPU is recommended with at least 16GB of memory on the machine.  
- To reproduce the representation visualization, the representation.py script can be used but one must specify the model weight location and relevant audio clip length. 

The models and utility functions provided can also generically be used for any audio-based classification task where one wants to experiment with audio length. The train_model function in src/trainer.py is fairly extensive. 


## Results

Copy some key results here.


## Conclusions
Copy the conclusion here.


## References

[1] Data source XXX