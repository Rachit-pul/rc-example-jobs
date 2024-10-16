# read in the biom file
otu_matrix <- as.matrix(read.table("otu_table.csv.gz"))
message("data loaded")

# replace any missing values with 0.1
otu_matrix[is.na(otu_matrix)] <- 0.1
message("replaced missing values")

# normalize the matrix
otu_matrix <- scale(otu_matrix)
message("normalization complete")

# convert all values to the absolute value
otu_matrix <- apply(otu_matrix, c(1,2), abs)
message ("absolute value transformation complete")

# transform values using Log2
otu_matrix <- apply(otu_matrix, c(1,2), log2)
message("log2 transformation complete")

# write the normalized matrix to normalized_otu_matrix.csv
write.table(otu_matrix,
            "normalized_otu_matrix.csv",
            sep=",",
            row.names=TRUE,
            col.names=TRUE)
