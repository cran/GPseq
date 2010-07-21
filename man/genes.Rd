\name{genes}
\docType{data}
\alias{genes}
\title{Gene annotations}
\description{ 
The dataset is a small subset of all human genes available in the RefSeq database. The gene annotations require the exon annotations along with the reads files.}
\usage{genes}
\format{The genes data is a (num_genes x 4) matrix where num_genes is the total number of uniquely annotated genes. Column 1 is the gene ID, column 2 is the starting exon and column 3 is the ending exon in the gene. If Column 2 = 1 and Column 3 = 4, then exons 1,2,3 and 4 are inside the gene. Column 4 is the gene length.num_genes = 2}
\source{NCBI RefSeq RNA Sequences}
\references{NCBI37, hg19 human genome}
\seealso{ \code{\link{reads}}, \code{\link{exons}} }
\keyword{ datasets }
