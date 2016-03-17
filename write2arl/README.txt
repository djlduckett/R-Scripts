write2arl

This script will take microsatellite, SNP, or mitochondrial sequence data in
.csv format and convert it into a fully-functioning Arlequin file. Note: this
script will not work well for hierarchical structure

Requirements: 
-R 
-R package dplyr 
-This R script 
-Data in csv format

Formatting: 
The first column must contain the sample name. Second column must contain the 
population name. For microsatellites and SNPS, each locus must be represented 
by two columns, one allele in each. For mitochondrial sequence, the entire 
sequence must be in the third column. See provided examples.

Use: 
Set your R working directory to the folder where you want the Arlequin file. 
Import your dataset into R. Make sure the dplyr library is loaded. Run the chunk 
containing the function write2arl. This only needs to be done once per R session. 
Use write2arl() to run the script. The write2arl command requires five arguments: 

title- will be used as both the output file name and the title name
in the Arlequin file. Must be in quotes "". 
df- the name of the dataframe to be
converted 
ut- the type of marker used, in quotes "". "MICROSAT" for
microsatellites, "STANDARD" for SNPS, or "DNA" for mitochondrial sequence 
np- the number of populations in the dataset 
md- the missing data character in your dataset, in quotes "". Often "?", "0", or "-9" 
Examples are provided in the script file.

* This script is provided for free and is without warranty. The author is not
responsible for any computer hardware or software malfunctions or any errant
results.