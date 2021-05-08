#Objective: this script creates a histogram of all of the quantified alignments in FPKM 
#after filtering the genes with an FPKM of 0

#Loaded the tidyverse package
library(tidyverse)

#Stored the FPKM counts for the P0 samples in a variable called P0_FPKM
P0_FPKM <- read.table(file="/projectnb/bf528/users/wheeler/project_5/Jessica/P0_1_tophat/P0_1_cufflinks/genes.fpkm_tracking", header=TRUE)

#Filtered the genes out with an FPKM of 0 (i.e., genes with no expression detected)
filtered_FPKM <- filter(P0_FPKM, P0_FPKM$FPKM > 0)

#Added 1 and log transformed the FPKMs to generate pseudocounts
Neonatal_FPKM <- log(filtered_FPKM$FPKM + 1)

#Plotted a histogram of the FPKM pseudocounts for the neonatal samples
hist(Neonatal_FPKM, col="blue")




