library(gdata)
library(gplots)
library(affy)
library(limma)
library(BH)
library(plogr)
library(makecdfenv)
library(affxparser)

#setwd("D:/DrOmicsClass/9Microarray/sample")

#to read the CEL files
#Readaffy() - use to read the affymatrix data
data = ReadAffy()
data 

#Get the signal value count
#exprs() - to get the expression count of data
raw_data = exprs(data)
View(raw_data)

#visulization of intensity distribution with the help of Boxplot
boxplot(data, las = 2, col= c("red","red","blue","blue","blue","blue","blue"),
                              names = c("c1","c2","t1","t2","t3","t4","t5"))
#Normalization using RMA
#RMA = Robust multichip Average
norm_data = rma(data)
norm_data_count = exprs(norm_data)
View(norm_data_count)

boxplot(exprs(norm_data), las = 1, col= c("red","red","blue","blue","blue","blue","blue"),
        names = c("c1","c2","t1","t2","t3","t4","t5"))

##calcualting the significance(P_value)
p_val= apply(norm_data_count, 1, function(x){t.test(x[1:2], x[3:7]) $p.value})

#cbind() - use to combine different tables together
combine_pvalue=cbind(norm_data_count, p_val)
View(combine_pvalue)

#Differential gene Expression
#Analysis plan = T vs C
mean_cntrl = rowMeans(combine_pvalue[,c("GSM213685_c1.CEL","GSM213686_c2.CEL")], na.rm = TRUE)
all_table = cbind(combine_pvalue, mean_cntrl)
View(all_table)

#calculating the fold change (T-C)
fold_change = all_table[,3:7] - all_table[,9]
View(fold_change)

colnames(fold_change) = c("T1vsC","T2vsC","T3vsC","T4vsC","T5vsC")
DE_result = cbind(all_table, fold_change)
View(DE_result)

#Export the DE result into excel file 
write.table(DE_result,file = "microarray_result_NGS3.xls", quote = F, sep = "\t", col.names = NA)

