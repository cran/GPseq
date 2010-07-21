\name{likelihood_ratio_poisson_exon_gene}
\alias{likelihood_ratio_poisson_exon_gene}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Log Likelihood ratio statistic for comparison of the splicing ratio of an exon across two conditions using the Poisson Distribution }
\description{
Comparing the splicing rate of Exon (count vector : z in Tissue/Condition 1, v in Tissue/Condition 2) in a given Gene ( count vector : x in Tissue/Condition 1, y in Tissue/Condition 2). The counts are modeled as a Poisson Distribution with lambda as the Maximum Likelihood Estimate. The Log Likelihood ratio is distributed as a Chi-Square distribution with degrees of freedom 1. Newton Raphson method is used to estimate the parameters in the null model. The results are only applicable if the Netwon Raphson algorithm converges. The Null is that the exon has the same splicing rate in both conditions.
}
\usage{
likelihood_ratio_poisson_exon_gene(z, x, v, y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{z}{ Count vector of Exon in Tissue/Condition 1  }
  \item{x}{ Count vector of Gene in Tissue/Condition 1  }
  \item{v}{ Count vector of Exon in Tissue/Condition 2  }
  \item{y}{ Count vector of Gene in Tissue/Condition 2 }
}
\value{
  \item{Ptest }{The Chi square statistic = -2*Log Likelihood Ratio Statistic}
}
\references{ Consul, P. C. (1989) \emph{Generalized Poisson Distributions: Properties and Applications.} New York: Marcel Dekker. \cr Sudeep Srivastava, Liang Chen \emph{A two-parameter generalized Poisson model to improve the analysis of RNA-Seq data}  Nucleic Acids Research Advance Access published July 29,2010 \emph{doi : 10.1093/nar/gkq670}  }
\author{ Sudeep Srivastava, Liang Chen }
\examples{
set.seed(666);
z = rpois(100,1);
x = c(z,rpois(200,5));
v = rpois(100,4);
y = c(v,rpois(200,8));

output = likelihood_ratio_poisson_exon_gene(z,x,v,y);

cat("Chi Square Statistic = ",output$Ptest,"\n");

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
