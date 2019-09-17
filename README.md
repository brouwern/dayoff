# The *dayoff* package

**dayoff** is a teaching-focused package based largely off of material adapated from Dr. Avril Coghlan's [A little book of R for bioinformatics](https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/).

The package is named in honor of pioneering biochemist and bioinformatician [Margaret Dayoff](https://en.wikipedia.org/wiki/Margaret_Oakley_Dayhoff) and features lessons (written by Nathan Brouwer) exploring the class [PAM matrcies](https://en.wikipedia.org/wiki/Point_accepted_mutation) used for scoring protein alignment

## Installation

*dayoff* can be installed from GitHub using the devtools package.

If you do not have the *devtools* installed run *install.packages("devtools")* first to download it.   (I have commented this out in case you already have devtools.  devtools is a package which is used by R package developers it has special functionality for downloading packages that have not been released on the offical CRAN website. 

``` r
## Download devtools if need
# install.packages("devtools")
```

With devtools, run *devtools::install_github("brouwern/dayoff")* to download *dayoff*.  (The install_github() comamnd lets you download a package which is in a GitHub code repository ("repo")).

``` r
# download dayoff
devtools::install_github("brouwern/dayoff")
```

Remember to load the package into your R session using library
``` r
#load dayoff
library("dayoff")
```


## Example

A dataset included in *dayoff* is from Higgs 2009 and contains information about the chemical properties of amino acids.

```r
data(aa_chars)
```


Make a histogram of from the data; You'll git some red text in the console; no worries
```r
gghistogram(data = aa_chars, x = "MW.da")
```



## A not on dependencies

*dayoff* off relies on a number of dependencies.  If you get an error after running *library(dayoff)* it may be due to an issue installing one of these packages, which you might be able to resolve by downloading the package by hand.  A list of dependecies is below.  They can be installed using the *install.packages* command, which was shown above for downloading devtools

* flextable,
* dplyr,
* tidyr,
* ggplot2,
* ggpubr,
* stringr,
* stringi,
* devtools,
* bookdown,
* here,
* webshot,
* BiocManager,
* seqinr,
* ape
* readxl,
* formatR,
* tufte
* rJava

