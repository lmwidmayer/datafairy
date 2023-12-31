% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/describe.R
\name{describe}
\alias{describe}
\title{Common metrics for numeric and factor-like data}
\usage{
describe(vec, na.rm = FALSE)
}
\arguments{
\item{vec}{a numeric vector.}

\item{na.rm}{a logical value indicating whether NA values should be excluded.}
}
\value{
dataframe of metrics.
}
\description{
Describe a numeric or factor-like vector by common metrics.
}
\details{
\code{na.rm} is FALSE by default. The total number of units will always
include NA.

\code{describe.character} uses \code{describe.factor}.
\code{describe.factor} does not use \code{na.rm}.
}
