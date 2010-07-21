\name{perform_permutation_ds}
\alias{perform_permutation_ds}
\title{Perform a Permutation Test to fit the null distribution of the test statistic to a Gamma Distribution}
\description{
  This function calculates the shape and scale parameters for a Gamma Distribution which is used to fit the null distribution of the test statistic calculated for the Differential Splicing of an exon in a gene between two conditions/samples. 
}
\usage{
perform_permutation_ds(x,y,exon_start,exon_end,n,num_permute)
}
\arguments{
  \item{x}{ Vector for counts of gene in sample 1}
  \item{y}{ Vector for counts of gene in sample 2}
  \item{exon_start}{ Start position of the exon in the gene}
  \item{exon_end}{ End position of the exon in the gene}
  \item{n}{Length of the exon}
  \item{num_permute}{Number of times the permutation is done}
}
\value{
  \item{shape}{The shape parameter of the Gamma distribution}
  \item{scale}{The scale parameter of the Gamma distribution}
}

\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data}  Nucleic Acids Research Advance Access published July 29,2010 \emph{doi : 10.1093/nar/gkq670}  }
  
\author{ Sudeep Srivastava, Liang Chen }

\examples{
x = rpois(100,10);
y = rpois(100,5);

exon_start = 1;
exon_end = 50;
gamma = perform_permutation_ds(x,y,exon_start,exon_end,50,60);

cat("Shape parameter = ",gamma$shape,"Scale parameter = ",gamma$scale);
}

\seealso{ \code{\link{generalized_poisson_likelihood}} }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
