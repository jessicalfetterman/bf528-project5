#The following script further evaluates a differential expression analysis from cuffdiff to identify significant DEGs
#and creates 2 dataframes- one for the significantly up-regulated and down-regulated genes
#Loaded tidyverse package
library(tidyverse)

#Stored the differential expression analysis from cuffdiff
###NOTE: need to swap out with my cuffdiff once done running
#DEG <- read.table(file="/projectnb/bf528/users/wheeler/project_2/cuffdiff_out/gene_exp.diff", header=TRUE)
DEG <- read.table(file="/projectnb/bf528/users/wheeler/project_5/Jessica/cuffdiff_out/gene_exp.diff", header=TRUE)

#Sorted the DEG dataframe so that the smallest q values are at the top and sliced the top 10 differentially expressed genes
top10_DEGs <- DEG[order(DEG$q_value, decreasing=FALSE),] %>% slice(1:10)
#wrote the top 10 DEGs to a csv file
write.csv(top10_DEGs, file.path("/projectnb/bf528/users/wheeler/project_5/Jessica", "top10degs.csv"), col.names=TRUE, row.names=FALSE, quote=FALSE)

#Created a histogram of the log2 fold changes
hist(DEG$log2.fold_change., breaks=25, col="blue")

#noted that some of the values were infinity... so I filtered the log fold change between -10 up to 10 and re-plotted
filtered_DEG <- filter(DEG, DEG$log2.fold_change. > -10 & DEG$log2.fold_change. <10)
hist(filtered_DEG$log2.fold_change., breaks=10, col="blue")
hist(filtered_DEG$log2.fold_change., col="blue")

#created a new dataframe containing only the significantly different genes in the DEG dataframe
DEG.sig <- subset(DEG, significant == 'yes')

#created a histogram of the log2 fold change of the genes that were significantly different
hist(DEG.sig$log2.fold_change., col="blue")

#created 2 additional dataframes- one for the significantly up-regulated DEGs and one for the significantly down-regulated DEGs
DEG.sig.up <- subset(DEG.sig, log2.fold_change. >0)
DEG.sig.down <- subset(DEG.sig, log2.fold_change. <0)

#wrote the significantly up- and down-regulated genes to 2 separate tables files
write.table(DEG.sig.up, file.path("/projectnb/bf528/users/wheeler/project_5/Jessica", "up-regulated-genes.txt"), col.names=FALSE, row.names=FALSE, quote=FALSE)
write.table(DEG.sig.down, file.path("/projectnb/bf528/users/wheeler/project_5/Jessica", "down-regulated-genes.txt"), col.names=FALSE, row.names=FALSE, quote=FALSE)

#wrote just the gene names for the up- and down-regulated genes on a new line that could more readily be pasted into DAVID
write.csv(DEG.sig.down$gene, file.path("/projectnb/bf528/users/wheeler/project_5/Jessica", "downregulatedgenelist.csv"), row.names=FALSE, quote=FALSE)
write.csv(DEG.sig.up$gene, file.path("/projectnb/bf528/users/wheeler/project_5/Jessica", "upregulatedgenelist.csv"), row.names=FALSE, quote=FALSE)
