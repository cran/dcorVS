\name{MMPC and the FBED variable selection algorithms using the distance correlation}
\alias{dcor.mmpc}
\alias{dcor.fbed}
\title{
MMPC and the FBED variable selection algorithms using the distance correlation
}

\description{
MMPC and the FBED variable selection algorithms using the distance correlation.
}

\usage{
dcor.mmpc(y, x, max_k = 3, alpha = 0.05, B = 999, backward = TRUE)
dcor.fbed(y, x, alpha = 0.05, K = 0, backward = TRUE)
}

\arguments{
\item{y}{
A numerical vector with the response variable.
}
\item{x}{
A numerical matrix with the predictor variables.
}
\item{max_k}{
The maximum conditioning set to use in the conditional indepedence test (see Details).
Integer, default value is 3.
}
\item{alpha}{
The significance level for assessing the p-values. Default value is 0.05.
}
\item{B}{
The number of permutations to execute to compute the p-value of the distance correlation.
}
\item{K}{

How many times should the process of the Forward Early Dropping be repeated? The default value is 0.
}
\item{backward}{
Should the backward selection take place? The default value is set to TRUE.
}
}

\details{
The FBED algorithm is a variation of the usual forward selection. At every step, the most significant
variable enters the selected variables set. In addition, only the significant variables stay and are
further examined. The non signifcant ones are dropped. This goes until no variable can enter the set.
The user has the option to re-do this step 1 or more times (the argument K). In the end, a backward
selection is performed to remove falsely selected variables. Note that you may have specified, for
example, K=10, but the maximum value FBED used can be 4 for example.

The max_k option in the mmpc algorithm: the maximum size of the conditioning set to use in the
conditioning independence test. Larger values provide more accurate results, at the cost of higher
computational times. When the sample size is small (e.g., \eqn{<50} observations) the max_k parameter
should be 3 for example, otherwise the conditional independence test may not be able to provide
reliable results.

Both the MMPC (Tsamardinos, Aliferis and Statnikov, 2003) and FBED algortihms
(Borboudakis and Tsamardinos, 2019) are performed though by utilizing the distance correlation
(Szekely et al., 2007, Szekely and Rizzo 2014, Huo and Szekely, 2016).
}

\value{
A list including:
\item{runtime}{
The duration of the algorithm.
}
\item{res}{
A matrix with the selected variables and their corresponding (logarithm) of the p-values of the updated associations. For the mmpc algorithm, the final p-value is the maximum p-value among the two p-values in the end.
}
}
\references{
Szekely G.J., Rizzo M.L. and Bakirov N.K. (2007). Measuring and Testing Independence
by Correlation of Distances. Annals of Statistics, 35(6): 2769--2794.

Szekely G.J. and Rizzo M. L. (2014). Partial distance correlation with methods for dissimilarities.
Annals of Statistics, 42(6): 2382--2412.

Huo X. and Szekely G.J. (2016). Fast computing for distance covariance.
Technometrics, 58(4): 435--447.

Tsamardinos I., Aliferis C. F. and Statnikov A. (2003). Time and sample efficient discovery of Markov
blankets and direct causal relations. In Proceedings of the ninth ACM SIGKDD international Conference
on Knowledge Discovery and Data Mining (pp. 673--678). ACM.

Brown L. E., Tsamardinos I. and Aliferis C. F. (2004). A novel algorithm for scalable and accurate
Bayesian network learning. Medinfo, 711--715.

Borboudakis G. and Tsamardinos I. (2019). Forward-backward selection with early dropping. 
Journal of Machine Learning Research, 20(8): 1--39.
}

\author{
Michail Tsagris.

R implementation and documentation: Michail Tsagris \email{mtsagris@uoc.gr}.
}

%\note{
%%  ~~further notes~~
%}
\seealso{
\code{\link{dcor.bs} }
}

\examples{
y <- rnorm(100)
x <- matrix( rnorm(100 * 50), ncol = 50 )
a <- dcor.fbed(y, x, backward = FALSE)
}

