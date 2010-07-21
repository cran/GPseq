\name{reads}
\docType{data}
\alias{reads}

\title{Mapped Reads}
\description{ A small subset of the reads from the MAQC2 and MAQC3 data sets obtained from Bullard et al. These reads were mapped using Bowtie version 0.12.1 to the human genome NCBI 37.1 or hg19 downloaded from the NCBI website. MAQC2 was for 2 biological samples, Brain and UHR and MAQC3 was for the UHR sample with 4 different library preparations. Hence there are 6 conditions in total.  }
\usage{reads}
\format{The reads data is a (num_reads x (3+num_conditions)) matrix where num_reads is the number of reads mapped in the experiment and num_conditions is the number of different conditions under which the experiment is done. Column 1 is the Gene ID of the gene the read maps to, column 2 is the Exon ID of the exon the read maps to, Column 3 is the Position of the read and Columns 4 to (3+num_conditions) is the coverage of that position in each of the conditions. num_reads = 183 for this dataset}
\source{The reads were downloaded from the Sequence Read Archive ID : SRA010153. }
\references{Bullard,J.H., E. Purdom, K.D. Hansen and S. Dudoit (2010) \emph{Evaluation of statistical methods for normalization and differential expression in mRNA-Seq experiments} BMC Bioinformatics 11:94}
\seealso{ \code{\link{genes}}, \code{\link{exons}} }
\keyword{ datasets }
