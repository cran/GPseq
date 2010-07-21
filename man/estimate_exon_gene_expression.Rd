\name{estimate_exon_gene_expression}
\alias{estimate_exon_gene_expression}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Estimating Exon and Gene Expressions using the Poisson and Generalized Poisson Models and calculating their goodness of fit statistic }
\description{
  Using the mapped reads and Exon and Gene annotations, this function calculates the Maximum Likelihood estimates for each gene and each exon within each gene when the counts are modeled as a Poisson and Generalized Poisson random variable. These models are further used to calculate the goodness of fit using a Chi-Square goodness of fit test. The function outputs 
  (a) The Maximum Likelihood estimates for theta and lambda for the Generalized Poisson model and Lambda for the Poisson model for each of the genes and the exons in the different conditions.
  (b) The Chi Square goodness of fit statistic for the Poisson and the Generalized Poisson Model for each of the exons and genes in all the different conditions.
}
\usage{
estimate_exon_gene_expression(reads, exons, genes)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{reads}{ The mapped reads output. See details  }
  \item{exons}{ The exon annotations and the reads mapping to a particular exon }
  \item{genes}{ The gene annotations and the exons mapping to the particular gene }
}
\details{
  \emph{reads}		The reads data is a (num_reads x (3+num_conditions)) matrix where num_reads is the number of reads mapped in the experiment and num_conditions is the number of different conditions under which the experiment is done. Column 1 is the Gene ID of the gene the read maps to, column 2 is the Exon ID of the exon the read maps to, Column 3 is the Position of the read and Columns 4 to (3+num_conditions) is the coverage of that position in each of the conditions. \cr
  \emph{exons} 		The exons data is a (num_exons x 4) matrix where num_exons is the total number of uniquely annotated exons. Column 1 is the exon ID, column 2 is the start position and column 3 is the end position of the reads mapping to an exon corresponding to the reads dataset. That is if column 2 =4 and column 3 = 15, reads 4 to 15 map to this particular exon. Column 4 is the length of the exon. \cr
 \emph{genes} 		The genes data is a (num_genes x 4) matrix where num_genes is the total number of uniquely annotated genes. Column 1 is the gene ID, column 2 is the starting exon and column 3 is the ending exon in the gene. If Column 2 = 1 and Column 3 = 4, then exons 1,2,3 and 4 are inside the gene. Column 4 is the gene length.
}
\value{
  \item{exon_out }{ exon_out[[i,j]] is the output for exon i in condition j. exon_out[[i,j]]$theta is the MLE for theta for the Generalized Poisson Model and exon_out[[i,j]]$lambda is the MLE for lambda for the Generalized Poisson Model. These two estimates are only valid if exon_out[[i,j]]$mark = 1. exon_out[[i,j]]$y_bar is the maximum likelihood estimate for lambda for the Poisson Model.}
  \item{chisq_exon_out }{ chisq_exon_out[[i,j]] is the output for the goodness of fit test for exon i in condition j. chisq_exon_out[[i,j]]$df1 is the degree of freedom and chisq_exon_out[[i,j]]$chisq1 is the chi-square statistic for the Generalized Poisson Model. These are only valid if chisq_exon_out[[i,j]]$mark1 = 1. chisq_exon_out[[i,j]]$df2 is the degree of freedom and chisq_exon_out[[i,j]]$chisq2 is the chi-square statistic for the Poisson Model. These are only valid if chisq_exon_out[[i,j]]$mark2 = 1. If chisq_exon_out[[i,j]] = NULL, then the Chi Square statistic was not calculated since the MLE could not be estimated for the Generalized Poisson Model.}
  \item{gene_out }{gene_out[[i,j]] is the output for gene i in condition j. gene_out[[i,j]]$theta is the MLE for theta for the Generalized Poisson Model and gene_out[[i,j]]$lambda is the MLE for lambda for the Generalized Poisson Model. These two estimates are only valid if gene_out[[i,j]]$mark = 1. gene_out[[i,j]]$y_bar is the maximum likelihood estimate for lambda for the Poisson Model.}
  \item{chisq_gene_out }{ chisq_gene_out[[i,j]] is the output for the goodness of fit test for gene i in condition j. chisq_gene_out[[i,j]]$df1 is the degree of freedom and chisq_gene_out[[i,j]]$chisq1 is the chi-square statistic for the Generalized Poisson Model. These are only valid if chisq_gene_out[[i,j]]$mark1 = 1. chisq_gene_out[[i,j]]$df2 is the degree of freedom and chisq_gene_out[[i,j]]$chisq2 is the chi-square statistic for the Poisson Model. These are only valid if chisq_gene_out[[i,j]]$mark2 = 1. If chisq_gene_out[[i,j]] = NULL, then the Chi Square statistic was not calculated since the MLE could not be estimated for the Generalized Poisson Model}
}

\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data} }
\author{ Sudeep Srivastava, Liang Chen }
\seealso{\code{\link{generalized_poisson_likelihood}}, \code{\link{calc_chisq_statistic}},\code{\link{reads}}, \code{\link{exons}}, \code{\link{genes}} }
\examples{
data(reads);
data(exons);
data(genes);

output = estimate_exon_gene_expression(reads,exons,genes);

##Looking at Exon 1 in condition 1
cat("Mark = ",output$exon_out[[1,1]]$mark," Theta = ",output$exon_out[[1,1]]$theta," Lambda = ",output$exon_out[[1,1]]$lambda," y_bar = ",output$exon_out[[1,1]]$y_bar,"\n");

if(output$exon_out[[1,1]]$mark == 1)
{
## Chi Square test for Generalized Poisson
cat("Mark = ",output$chisq_exon_out[[1,1]]$mark1," Degrees of Freedom = ",output$chisq_exon_out[[1,1]]$df1," Chi Square Statistic ",output$chisq_exon_out[[1,1]]$chisq1,"\n");
## Chi Square test for Poisson
cat("Mark = ",output$chisq_exon_out[[1,1]]$mark2," Degrees of Freedom = ",output$chisq_exon_out[[1,1]]$df2," Chi Square Statistic ",output$chisq_exon_out[[1,1]]$chisq2,"\n");
}

##Looking at Gene1 in condition 1
cat("Mark = ",output$gene_out[[1,1]]$mark," Theta = ",output$gene_out[[1,1]]$theta," Lambda = ",output$gene_out[[1,1]]$lambda," y_bar = ",output$gene_out[[1,1]]$y_bar,"\n");

if(output$gene_out[[1,1]]$mark == 1)
{
## Chi Square test for Generalized Poisson
cat("Mark = ",output$chisq_gene_out[[1,1]]$mark1," Degrees of Freedom = ",output$chisq_gene_out[[1,1]]$df1," Chi Square Statistic ",output$chisq_gene_out[[1,1]]$chisq1,"\n");
## Chi Square test for Poisson
cat("Mark = ",output$chisq_gene_out[[1,1]]$mark2," Degrees of Freedom = ",output$chisq_gene_out[[1,1]]$df2," Chi Square Statistic ",output$chisq_gene_out[[1,1]]$chisq2,"\n");
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
