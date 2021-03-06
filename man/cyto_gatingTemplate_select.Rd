% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyto_gatingTemplate-helpers.R
\name{cyto_gatingTemplate_select}
\alias{cyto_gatingTemplate_select}
\title{Select a gatingTemplate for downstream analyses}
\usage{
cyto_gatingTemplate_select(x)
}
\arguments{
\item{x}{name of the gatingTemplate csv file to assign as the active
gatingTemplate for downstream analyses.}
}
\value{
select a gatingTemplate as the active gatingTemplate for downstream
  analyses.
}
\description{
\code{cyto_gatingTemplate_select} will designate which gatingTemplate should
be used for storing downstream gating results.
\code{cyto_gatingTemplate_select} should therefore be called prior to gating
or \code{gate_draw} will resort to using \code{"gatingTemplate.csv"} to save
the constructed gates. \code{cyto_gatingTemplate_select} also provides an
easy way to switch between gatingTemplates when multiple templates are
required.
}
\examples{
cyto_gatingTemplate_select("Activation_gatingTemplate")
}
\seealso{
\code{\link{cyto_gatingTemplate_edit}}
}
\author{
Dillon Hammill (Dillon.Hammill@anu.edu.au)
}
