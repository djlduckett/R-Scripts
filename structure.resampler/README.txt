structure.resampler

This script will take microsatellite, SNP, or mitochondrial sequence data in
.csv format and subsample the desired number of individuals per population and
the desired number of loci. It then writes the new dataset to an Arlequin
formatted file, and analyzes the dataset using Arlequin. Analyses performed
include AMOVA, pairwise Fst, and Exact Test. The script parses the results for
each of a user-selected number of replicates, and then summarizes the results
across all replicates.

Requirements: 
-R 
-R packages dplyr, stats, stringr, and XML 
-This R script 
-Data in csv format
-arlecore (obtained from the Arlequin website)
-arl_run.ars file (contains settings for Arlequin) provided

Formatting: 
The first column must contain the sample name. Second column must
contain the population name. For microsatellites and SNPs, each locus must be
represented by two columns, one allele in each. For mitochondrial sequence, the
entire sequence must be in the third column. See provided examples.

Use: 
Set your R working directory to the folder where you want the output and
results files to be written. This folder must also contain the arlecore 
application and the arl_run.ars file. Import your dataset into R. Make sure the 
required libraries are loaded. Run the chunk containing code for the molecular 
marker you are using (resample_microsat, resample_snp, or resample_mtdna). This 
only needs to be done once per R session. Use resample_X() to run the script, 
where X indicates the marker type. The resample_X command requires eight arguments:

df- The name of the dataframe to be resampled 
np- The number of populations in the dataset 
sind- The number of individuals to sample from each population
sloci- The number of loci to sample ut- the type of marker used, in quotes "".
"MICROSAT" for microsatellites, "STANDARD" for SNPS, or "DNA" for mitochondrial
sequence 
md- the missing data character in your dataset, in quotes "". Often "?", "0", or "-9" 
title- will be used as the title name in the Arlequin file. Must be in quotes "". 
n.reps- The number of replicates to perform

Notes: This script can create a lot of files (approximately seven per replicate). 
If the value of sind is larger than the number of samples in a population, the 
analysis will be performed with all individuals in that population.

Status: Currently making the finishing touches. Script will be up by 4/1/16.
