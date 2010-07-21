\name{estimate_differential_splicing}
\alias{estimate_differential_splicing}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Estimating differential splicing statistics for an exon in a gene between all possible pairwise conditions }
\description{
  Using the mapped reads and Exon and Gene annotations, this function calculates the statistics to assess differential splicing of an exon in a a gene across two conditions using the Poisson and Generalized Poisson Model. In both models, the final statistic is a Chi Square distributed random variable with 1 degree of freedom. The estimation of the parameters of the Generalized Poisson Model rely on the convergence of the Newton Raphson algorithm and therefore the statistics are only valid if the algorithm has converged for both the conditions being compared.
}
\usage{
estimate_differential_splicing(reads, exons, genes, do_permute)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{reads}{The mapped reads output. See details }
  \item{exons}{The exon annotations and the reads mapping to a particular exon }
  \item{genes}{ The gene annotations and the exons mapping to the particular gene }
  \item{do_permute}{ If do_permute = 1, a permutation test will be performed to fit the null distribution of the test statistic to a Gamma distribution }
}
\details{
 \emph{reads} The reads data is a (num_reads x (3+num_conditions)) matrix where num_reads is the number of reads mapped in the experiment and num_conditions is the number of different conditions under which the experiment is done. Column 1 is the Gene ID of the gene the read maps to, column 2 is the Exon ID of the exon the read maps to, Column 3 is the Position of the read and Columns 4 to (3+num_conditions) is the coverage of that position in each of the conditions. \cr
 \emph{exons} The exons data is a (num_exons x 4) matrix where num_exons is the total number of uniquely annotated exons. Column 1 is the exon ID, column 2 is the start position and column 3 is the end position of the reads mapping to an exon corresponding to the reads dataset. That is if column 2 =4 and column 3 = 15, reads 4 to 15 map to this particular exon. Column 4 is the length of the exon. \cr
 \emph{genes} The genes data is a (num_genes x 4) matrix where num_genes is the total number of uniquely annotated genes. Column 1 is the gene ID, column 2 is the starting exon and column 3 is the ending exon in the gene. If Column 2 = 1 and Column 3 = 4, then exons 1,2,3 and 4 are inside the gene. Column 4 is the gene length. 
}
\value{
  \item{out_gp }{out_gp[[i,j,k,l]]$Gptest is the test statistic for differential alternative splicing of Exon j of Gene i between conditions k and l(k < l) when the gene counts are modeled as a Generalized Poisson Random Variable. The test statistic is only valid if out_gp[[i,j,k,l]]$mark = 1. If out_gp[[i,j,k,l]] = NULL, then the test could not be carried out because the MLE for the Generalized Poisson model for one of the parameters could not be calculated. If do_permute = 1 and the statistic has converged, then out_gp[[i,j,k,l]]$shape is the shape parameter and out_gp[[i,j,k,l]]$scale is the scale parameter for the gamma distribution used to model the null distribution of the test statistic for comparing conditions k and l of Exon j of Gene i.}
  \item{out_p }{out_p[[i,j,k,l]]$Ptest is the test statistic for differential alternative splicing of Exon j of Gene i between conditions k and l(k < l) when the gene counts are modeled as a Poisson Random Variable.If out_p[[i,j,k,l]] = NULL, then the test statistic for the Poisson Model was not calculated since gp_comparison[[i,j,k]] = NULL}
}
\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data}  Nucleic Acids Research Advance Access published July 29,2010 \emph{doi : 10.1093/nar/gkq670}  }
\author{ Sudeep Srivastava, Liang Chen }
\seealso{ \code{\link{likelihood_ratio_generalized_poisson_exon_gene}},\code{\link{likelihood_ratio_poisson_exon_gene}}, \code{\link{reads}}, \code{\link{exons}}, \code{\link{genes}}  }
\examples{

data(reads);
data(exons);
data(genes);

output = estimate_differential_splicing(reads,exons,genes,0);

#Comparing Exon1 in Gene 2 between conditions 1 and 2

cat("Mark = ",output$out_gp[[2,1,1,2]]$mark," Test Statistic with Generalized Poisson Model = ", output$out_gp[[2,1,1,2]]$Gptest,"\n");

cat("Test Statistic with Poisson Model = ",output$out_p[[2,1,1,2]]$Ptest,"\n");

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
