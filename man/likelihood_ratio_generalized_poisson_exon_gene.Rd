\name{likelihood_ratio_generalized_poisson_exon_gene}
\alias{likelihood_ratio_generalized_poisson_exon_gene}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Log Likelihood ratio statistic for comparison of the splicing ratio of an exon in two conditions }
\description{
  Comparing the splicing rate of Exon (count vector : z in Tissue/Condition 1, v in Tissue/Condition 2) in a given Gene ( count vector : x in Tissue/Condition 1, y in Tissue/Condition 2). The Log Likelihood ratio is distributed as a Chi-Square distribution with degrees of freedom 1. Newton Raphson method is used to estimate the parameters in the null model. The results are only applicable if the Netwon Raphson algorithm converges. The Null is that the exon has the same splicing rate in both conditions.
}
\usage{
likelihood_ratio_generalized_poisson_exon_gene(z, theta1, lambda1, x, theta2, lambda2, v, theta3, lambda3, y, theta4, lambda4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{z}{ Count vector of Exon in Tissue/Condition 1 }
  \item{theta1}{ Maximum likelihood estimator for theta when z is modeled as a Generalized Poisson random variable. }
  \item{lambda1}{ Maximum likelihood estimator for lambda when z is modeled as a Generalized Poisson random variable. }
  \item{x}{ Count vector of Gene in Tissue/Condition 1 }
  \item{theta2}{  Maximum likelihood estimator for theta when x is modeled as a Generalized Poisson random variable. }
  \item{lambda2}{  Maximum likelihood estimator for theta when x is modeled as a Generalized Poisson random variable. }
  \item{v}{ Count vector of Exon in Tissue/Condition 2 }
  \item{theta3}{  Maximum likelihood estimator for theta when v is modeled as a Generalized Poisson random variable. }
  \item{lambda3}{  Maximum likelihood estimator for theta when v is modeled as a Generalized Poisson random variable. }
  \item{y}{ Count vector of Gene in Tissue/Condition 2 }
  \item{theta4}{ Maximum likelihood estimator for theta when y is modeled as a Generalized Poisson random variable. }
  \item{lambda4}{ Maximum likelihood estimator for theta when y is modeled as a Generalized Poisson random variable. }
}
\value{
  \item{mark }{1 if the Newton Raphson Algorithm converges}
  \item{Gptest }{-2*Log Likelihood Ratio Statistic}
}
\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data} }
\author{ Sudeep Srivastava, Liang Chen }
\examples{
set.seed(666);
z = rpois(100,1);
x = c(z,rpois(200,5));
v = rpois(100,4);
y = c(v,rpois(200,8));

outz = generalized_poisson_likelihood(z);
outx = generalized_poisson_likelihood(x);
outv = generalized_poisson_likelihood(v);
outy = generalized_poisson_likelihood(y);

if(outz$mark == 1 && outx$mark == 1 && outv$mark == 1 && outy$mark == 1)
{
  output = likelihood_ratio_generalized_poisson_exon_gene(z,outz$theta,outz$lambda,x,outx$theta,outx$lambda,v,outv$theta,outv$lambda,y,outy$theta,outy$lambda);
  cat("Converged = ",output$mark," Test Statistic = ",output$Gptest,"\n");
}

}
\seealso{ \code{\link{generalized_poisson_likelihood}} , \code{\link{likelihood_ratio_poisson_exon_gene}}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
