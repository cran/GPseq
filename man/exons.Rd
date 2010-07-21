\name{exons}
\docType{data}
\alias{exons}

\title{Exon Annotation Database}
\description{
This particular data set is a small subset of the entire exon data set used in our study. The exons are obtained from the NCBI human RefSeq RNA Sequences. Overlapping exons are combined to form non-overlapping exons. The read positions are related to the reads database.}
\usage{exons}
\format{The exons data is a (num_exons x 4) matrix where num_exons is the total number of uniquely annotated exons. Column 1 is the exon ID, column 2 is the start position and column 3 is the end position of the reads mapping to an exon corresponding to the reads dataset. That is if column 2 =4 and column 3 = 15, reads 4 to 15 map to this particular exon. Column 4 is the length of the exon. num_exons = 8}
\source{NCBI human RefSeq RNA Sequences}
\references{NCBI 37, hg19 human genome}
\seealso{   \code{\link{reads}}, \code{\link{genes}} }
\keyword{ datasets }
