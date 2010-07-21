\name{estimate_differential_expression}
\alias{estimate_differential_expression}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Estimating differential expression statistics for Genes between all possible pairwise conditions }
\description{
  Using the mapped reads and Exon and Gene annotations, this function calculates the statistics to assess differential expression of genes using both the Poisson model and the Generalized Poisson Model. In both models, the final statistic outputted by the function is a Chi Square distributed random variable with degree of freedom = 1. Since the estimation of the parameters of the Generalized Poisson Model rely on the convergence of the Newton Raphson algorithm, the statistics are only valid if the algorithm has converged for both the conditions being compared.
}
\usage{
estimate_differential_expression(reads, exons, genes, norm_gp, norm_p, do_permute)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{reads}{ The mapped reads output. See details }
  \item{exons}{The exon annotations and the reads mapping to a particular exon }
  \item{genes}{ The gene annotations and the exons mapping to the particular gene }
  \item{norm_gp}{ The normalizing values for the generalized Poisson Model for each condition. Therefore the normalizing factor for condition 3 vs condition 2 would be norm_gp[2]/norm_gp[3] }
  \item{norm_p}{ The normalizing values for the Poisson Model. }
  \item{do_permute}{ If do_permute = 1, a permutation test will be performed to fit the null distribution of the test statistic to a Gamma distribution }
}
\details{
 \emph{reads}		The reads data is a (num_reads x (3+num_conditions)) matrix where num_reads is the number of reads mapped in the experiment and num_conditions is the number of different conditions under which the experiment is done. Column 1 is the Gene ID of the gene the read maps to, column 2 is the Exon ID of the exon the read maps to, Column 3 is the Position of the read and Columns 4 to (3+num_conditions) is the coverage of that position in each of the conditions. \cr
 \emph{exons}		The exons data is a (num_exons x 4) matrix where num_exons is the total number of uniquely annotated exons. Column 1 is the exon ID, column 2 is the start position and column 3 is the end position of the reads mapping to an exon corresponding to the reads dataset. That is if column 2 =4 and column 3 = 15, reads 4 to 15 map to this particular exon. Column 4 is the length of the exon. \cr
 \emph{genes}		The genes data is a (num_genes x 4) matrix where num_genes is the total number of uniquely annotated genes. Column 1 is the gene ID, column 2 is the starting exon and column 3 is the ending exon in the gene. If Column 2 = 1 and Column 3 = 4, then exons 1,2,3 and 4 are inside the gene. Column 4 is the gene length.
}

\value{
  \item{gp_comparison }{ gp_comparison[[i,j,k]]$Gptest is the test statistic for the differential expression of Gene i between conditions j and k ( j < k) when the gene counts are modeled as a Generalized Poisson Random variable. This test statistic is only valid if gp_comparison[[i,j,k]]$mark = 1. If gp_comparison[[i,j,k]] = NULL, then the test could not be carried out because the MLE for the Generalized Poisson model for one of the parameters could not be calculated. If do_permute = 1 and the algorithm has converged, gp_comparison[[i,j,k]]$shape is the shape parameter and gp_comparison[[i,j,k]]$scale is the scale parameter for the gamma distribution used to model the null distribution of the test statistic}
  \item{p_comparison }{ p_comparison[[i,j,k]]$Ptest is the test statistic for the differential expression of Gene i between conditions j and k ( j < k) when the gene counts are modeled as a Poisson Random variable. If p_comparison[[i,j,k]] = NULL, then the test statistic for the Poisson Model was not calculated since gp_comparison[[i,j,k]] = NULL}
}
\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data} Nucleic Acids Research Advance Access published July 29,2010 \emph{doi : 10.1093/nar/gkq670}  }
\author{ Sudeep Srivastava, Liang Chen }
\seealso{  \code{\link{likelihood_ratio_tissue_generalized_poisson}}, \code{\link{likelihood_ratio_tissue_poisson}}, \code{\link{reads}}, \code{\link{exons}}, \code{\link{genes}} }
\examples{
data(reads);
data(exons);
data(genes);
set.seed(666);
norm_gp = runif(6,0,1);
norm_p = runif(6,0,1);

output = estimate_differential_expression(reads,exons,genes,norm_gp,norm_p,0);

##Comparing Gene 1 between condition 1 and 2
cat("Mark = ",output$gp_comparison[[1,1,2]]$mark," Test Statistic with Generalized Poisson Model = ", output$gp_comparison[[1,1,2]]$Gptest,"\n");

cat("Test Statistic with Poisson Model = ",output$p_comparison[[1,1,2]]$Ptest,"\n");


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
