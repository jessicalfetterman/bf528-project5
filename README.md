# bf528-project5- JessicaFetterman

#The bash script run_tophat.qsub aligns paired end reads (P0_1_1.fastq and P0_1_2.fastq) to the mouse reference genome mm9.

#The bash script run_cufflinks.qsub calculates the FPKM for all of the genes in the neonatal cardiac samples using the mm9 reference genome and annotation.

#The bash script genebodycoverage.qsub utilizes geneBody_coverage.py within the RseQC package in Python3 to calculate the RNA-seq read coverage over the gene body using the sorted and indexed Bam files.

#The bash script run_cuffdiff.qsub uses the cuffdiff package in cufflinks to identify differentially expressed genes by calculating the FPKMs for the neonatal and adult cardiac samples (2 replicates for each experimental group) from sam files. The reference genome and corresponding annotation used was mm9. 

#The R script project2_programmer_Fetterman.R creates a histogram of all of the quantified alignments in FPKM for the neonatal cardiac samples after filtering for the genes with an FPKM of 0. 

#The R script project2_analyst_Fetterman.R identifies the top 10 DEGs from the gene_exp.diff output by sorting the genes based upon q value and slicing the top 10 genes with the smallest q values. This script also creates histograms of the log2 fold changes for all of the genes and after filtering for genes with a fold change between -10 and 10. Lastly, this script identifies the up- and down-regulated genes in the adult cardiac samples compared to the neonatal cardiac samples, writing the up- and down-regulated genes to tables. 
