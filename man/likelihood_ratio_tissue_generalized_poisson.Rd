\name{likelihood_ratio_tissue_generalized_poisson}
\alias{likelihood_ratio_tissue_generalized_poisson}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Chi Square test statistic for comparison of expression levels of genes/exons across two conditions using the Generalized Poisson model}
\description{
  This function compares the expression pattern of a given gene/exon across two given conditions or tissues. The null is that the gene is not differentially expressed across the two conditions. The input is the counts of a given gene/exon at each position in the two tissues and is modeled as a Generalized Poisson. The function outputs -2 times The Log likelihood ratio which is distributed as a Chi-Square with 1 degree of freedom. The Newton Raphson method is used to estimate the parameters in the null model and therefore the results are only applicable if the algorithm converges.
}
\usage{
likelihood_ratio_tissue_generalized_poisson(x, lambda1, theta1, y, lambda2, theta2, w)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ Count vector of Gene/Exon  in condition 1 }
  \item{lambda1}{ Lambda parameter for the Generalized Poisson for the Gene/Exon counts in Condition 1 }
  \item{theta1}{ Theta parameter for the Generalized Poisson for the Gene/Exon counts in Condition 2  }
  \item{y}{ Count vector of Gene/Exon in condition 2 }
  \item{lambda2}{  Lambda parameter for the Generalized Poisson for the Gene/Exon counts in condition 1  }
  \item{theta2}{ Theta parameter for the Generalized Poisson for the Gene/Exon counts in condition 2  }
  \item{w}{ Normalizing factor of condition 1 compared to condition 2 }
}

\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{mark }{1 if the Newton Raphson algorithm converges. The test statistic is only valid if mark = 1}
  \item{Gptest }{Chi Square Statistic = -2 * Log Likelihood Ratio }
}
\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data}  Nucleic Acids Research Advance Access published July 29,2010 \emph{doi : 10.1093/nar/gkq670}  }
\author{ Sudeep Srivastava, Liang Chen }
\examples{
set.seed(666);
x <- rpois(100,1);
y <- rpois(100,5);

outx = generalized_poisson_likelihood(x);
outy = generalized_poisson_likelihood(y);
w = runif(1,0,1);

output = likelihood_ratio_tissue_generalized_poisson(x,outx$lambda,outx$theta,y,outy$lambda,outy$theta,w);

cat("Converged = ",output$mark," Test Statistic = ",output$Gptest,"\n");
}
\seealso{ \code{\link{generalized_poisson_likelihood}} , \code{\link{likelihood_ratio_tissue_poisson}}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
