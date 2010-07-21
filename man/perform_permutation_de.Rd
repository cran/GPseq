\name{perform_permutation_de}
\alias{perform_permutation_de}
\title{Perform a Permutation Test to fit the null distribution of the test statistic to a Gamma Distribution}
\description{
  This function calculates the shape and scale parameters for a Gamma Distribution which is used to fit the null distribution of the test statistic calculated for the Differential Expression of two genes or exons 
}
\usage{
perform_permutation_de(x,y,num_permute)
}
\arguments{
  \item{x}{ Vector for counts of gene/exon in sample 1}
  \item{y}{ Vector for counts of gene/exon in sample 2}
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

gamma = perform_permutation_de(x,y,10);

cat("Shape parameter = ",gamma$shape,"Scale parameter = ",gamma$scale);
}

\seealso{ \code{\link{generalized_poisson_likelihood}} }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
