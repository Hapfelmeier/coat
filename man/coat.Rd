% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coat-methods.R, R/coat.R
\name{coef.coat}
\alias{coef.coat}
\alias{node_baplot}
\alias{coat}
\alias{plot.coat}
\title{Conditional method agreement trees (coat)}
\usage{
coat(
  y1,
  y2,
  covars,
  data,
  means = FALSE,
  type = c("ctree", "disttree", "mob")[1],
  ...
)

\method{plot}{coat}(x, digits = 2, xlim.max = NULL, level = 0.95, ...)
}
\arguments{
\item{...}{further arguments passed to \code{\link[partykit]{ctree_control}} or the fit function of \code{\link[partykit]{mob}}.}

\item{level}{a numeric specifying the desired coverage of the prediction interval.}

\item{digits}{a numeric specifying the number of digits to display.}

\item{y1}{a character string specifying the variable in data containing the measurements by one method.}

\item{y2}{a character string specifying the variable in data containing the measurements by another method.}

\item{covars}{a character string or vector of a single or multiple covariates.}

\item{data}{a data frame containing \code{y1}, \code{y2} and \code{covars}.}

\item{means}{a logical indicating whether intraindividual mean values of measurements shall be included as covariate.}

\item{type}{a character string specifying the type of coat model to be fit. Either \code{"ctree"} (default), \code{"disttree"} (equals \code{"ctree"}) or \code{"mob"}.}

\item{x}{an object as returned by \code{\link[coat]{coat}}.}

\item{xlim.max}{an optional numeric value to define the upper limit of the x-axis.}
}
\value{
Object of class \code{coat}.
}
\description{
Functions to fit and plot \code{coat} models.
}
\details{
The minimum number of observations required to model conditional agreement defaults to 20. Users may choose to modify this value as needed. See \code{\link[partykit]{ctree_control}} and \code{\link[partykit]{mob_control}} for details.
}
\section{Methods (by generic)}{
\itemize{
\item \code{plot(coat)}: function to plot a coat model.

}}
\examples{
\dontshow{ if(!requireNamespace("MethComp")) {
  if(interactive() || is.na(Sys.getenv("_R_CHECK_PACKAGE_NAME_", NA))) {
    stop("the MethComp package is required for this example but is not installed")
  } else q() }
}
### load package ###
library("coat")

### data ###
data("scint", package = "MethComp")
## transform data to required 'wide' format
scint_wide <- reshape(scint, v.names = "y", timevar = "meth", idvar = "item", direction = "wide")

### fit coat model using ctree() ###
mytree1 <- coat("y.DTPA", "y.DMSA", c("age", "sex"), data = scint_wide)
## including mean values as predictor
mytree2 <- coat("y.DTPA", "y.DMSA", c("age", "sex"), data = scint_wide, means = TRUE)

### plot ###
plot(mytree1)
plot(mytree1, digits = 2, xlim.max = 120)
plot(mytree2, digits = 2, xlim.max = 120)

}
