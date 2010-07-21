\name{calc_chisq_statistic}
\alias{calc_chisq_statistic}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate Chi-square goodness of fit Statistic for Generalized Poisson and Poisson Models.}
\description{
  This function calculates the Chi-Square goodness of fit statistic for how well the input data fit a Generalized Poisson Model with given parameters theta and lambda and fit a Poisson Model with the MLE as the value for lambda.
}
\usage{
calc_chisq_statistic(x, lambda, theta)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ This is the vector of observations or counts }
  \item{lambda}{ This is lambda for the Generalized Poisson Model }
  \item{theta}{ This is theta for the Generalized Poisson Model }
}
\value{
  \item{mark1 }{ The Chi-Square test for the Generalized Poisson Model is valid only if mark1 = 1}
  \item{mark2 }{ The Chi-Square goodness of fit test for the Poisson model is valid only if mark2 = 1.}
 \item{df1 }{ Degrees of freedom for the chi-square statistic for the fit to the Generalized Poisson Model}
  \item{df2 }{ Degrees of freedom for the chi-square statistic for the fit to the Poisson Model}
  \item{chisq1 }{ Chi Square statistic for the fit to the Generalized Poisson Model}
  \item{chisq2 }{ Chi Square Statistic for the fit to the Poisson Model}
}
\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data} Nucleic Acids Research Advance Access published July 29,2010 \emph{doi : 10.1093/nar/gkq670} }
  
\author{ Sudeep Srivastava, Liang Chen }

\examples{
y = rpois(100,10);

out = generalized_poisson_likelihood(y);

if(out$mark == 1)
{
  chisq_out = calc_chisq_statistic(y,out$lambda,out$theta);
}

#Check for Goodness of Fit of Generalized Poisson Model
if(chisq_out$mark1 == 1)
{
  cat("Degree of Freedom = ",chisq_out$df1," Chi Square Statistic = ",chisq_out$chisq1,"\n");
}
#Check for Goodness of FIt of Poisson Model
if(chisq_out$mark2 == 1)
{
  cat("Degree of Freedom = ",chisq_out$df2," Chi Square Statistic = ",chisq_out$chisq2,"\n");
}
 
}
\seealso{ \code{\link{generalized_poisson_likelihood}} }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
