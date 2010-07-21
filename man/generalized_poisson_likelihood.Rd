\name{generalized_poisson_likelihood}
\alias{generalized_poisson_likelihood}
\title{ Maximum Likelihood Estimates for the Generalized Poisson Model }
\description{
  This function calculates the Maximum Likelihood estimates for theta and lambda when vector y is fit to the Generalized Poisson Model. Newton Raphson Method is employed to calculate the MLE. The values are only valid if the Newton Raphson Method converges. 
}
\usage{
generalized_poisson_likelihood(y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{ Vector of counts.  }
}

\value{
  \item{mark }{1 if the Newton Raphson Method converges. If mark = 0, then the values of theta and lambda are not applicable}
  \item{theta }{ Maximum Likelihood Estimate for theta in the Generalized Poisson Model(theta,lambda)}
  \item{lambda}{ Maximum Likelihood Estimate for lambda in the Generalized Poisson Model(theta,lambda)}
  \item{y_bar}{ Mean of y which is also the Maximum Likelihood Estimate for lambda for the Poisson model}
  \item{length}{ Length of y which will be later used to calculate the normalization values}
}
\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data} Nucleic Acids Research Advance Access published July 29,2010 \emph{doi : 10.1093/nar/gkq670}  }
\author{ Sudeep Srivastava, Liang Chen }
\examples{
y = rpois(100,10);
out = generalized_poisson_likelihood(y);
#Check if it converged
if(out$mark==1)
{
#Value of Theta
  cat("theta = ",out$theta,"lambda = ",out$lambda,"lambda_poisson = ",out$y_bar,"Length = ",out$length,"\n");
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
