% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyto-helpers.R
\name{cyto_details_save}
\alias{cyto_details_save}
\title{Save experiment details to csv file}
\usage{
cyto_details_save(x, save_as = NULL)
}
\arguments{
\item{x}{object of class \code{flowSet} or \code{GatingSet} annotated with
experiment details.}

\item{save_as}{name of csv file to which the experiment details shuld be
saved.}
}
\value{
write experiment details to named csv file.
}
\description{
Save experiment details to csv file
}
\examples{
\dontrun{
library(CytoExploreRData)

# Activation GatingSet
gs <- GatingSet(Activation)

# Modify experiment details manually
cyto_details(gs)$Treatment <- c(
  rep("A", 8),
  rep("B", 8),
  rep("C", 8),
  rep("D", 8),
  NA
)

# Save experiment details to file
cyto_details_save(gs)
}

}
\author{
Dillon Hammill, \email{Dillon.Hammill@anu.edu.au}
}
