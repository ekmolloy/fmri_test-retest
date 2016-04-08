Tools for test-retest FMRI studies
==========================================

Analyze data from test-retest functional neuroimaging studies quickly using MATLAB. Metrics include the Intraclass Correlation Coefficient (ICC), Kendall's Coefficient of Concordance (W), Root-Mean Squared Deviation (RMSD), and the Dice Coefficient. These MATLAB scripts were used in serveral test-retest studies performed in the Birn Laboratory, including Birn R.M., Molloy E.K., et al. (2013). The effect of scan length on the reliability of resting-state fMRI connectivity estimates. *Neuroimage* 83: 550-558. [doi:10.1016/j.neuroimage.2013.05.099](http://dx.doi.org/10.1016/j.neuroimage.2013.05.099).

Citation
--------
Molloy, E.K. and Birn, R.M. (2014). Tools for test-retest FMRI studies. ZENODO. [DOI:10.5281/zenodo.49326](http://dx.doi.org/10.5281/zenodo.49326).

[![DOI](https://zenodo.org/badge/6230/ekmolloy/fmri_test-retest.svg)](https://zenodo.org/badge/latestdoi/6230/ekmolloy/fmri_test-retest)

Examples
--------
Let matrix **X** represent data from 6 subjects collected across 4 functional imaging sessions. For example, these data could represent seed-based connecitivty in region-of-interest (ROI). The Intraclass Correlation Coefficient (ICC) with a random effects model can help us determine the reliablity of this measurement across scanning sesions. 
```
X = [[9, 2, 5, 8],
     [6, 1, 3, 2],
     [8, 4, 6, 8],
     [7, 1, 2, 6],
     [10, 5, 6, 9],
     [6, 2, 4, 7]];

[icc] = ICC(X, 1, 1);
```
Let **A** represent data from a single subject across three scans. For example, these data could represent seed-based connectivity in 5 different regions of interest. Kendall's W can help us determine the similarity between the rankings of these ROIs with respect to the level of connectivity across different scanning sessions.
```
A = [[14, 13, 13, 14, 13],
     [11, 12, 13, 16, 15],
     [12, 10, 13, 16, 15]];

[w, chi2, df, pval] = KendallsW(X);
```
Now suppose matrix **A** is a connectivity matrix from a single subject, where data represent the connectivity between ROIs defined by the rows and columns. Let **B** be anouther connectivity matrix for the same subject but computed from a different scanning session. The RMSD and Dice Coefficient can help us determine the similarity between the subject's connectivity matrices across scanning sessions.
```
B = [[12, 18, 19, 14, 16],
     [13, 17, 12, 12, 15],
     [10, 16, 18, 11, 11]];

[rmsd] = RMSD(A, B);
[dc] = DC(A, B, 13, 13, 1);
```
