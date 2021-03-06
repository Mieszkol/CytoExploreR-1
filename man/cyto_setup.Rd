% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyto-helpers.R
\name{cyto_setup}
\alias{cyto_setup}
\title{Load.fcs files into GatingSet and annotate with experiment details}
\usage{
cyto_setup(
  path = ".",
  gatingTemplate = NULL,
  restrict = FALSE,
  clean = FALSE,
  markers = TRUE,
  parse_names = FALSE,
  details = TRUE,
  sample = FALSE,
  ...
)
}
\arguments{
\item{path}{points to the location of the .fcs files to read in (e.g. name of
a folder in current working directory).}

\item{gatingTemplate}{name of a gatingTemplate csv file to be used for gate
saving.}

\item{restrict}{logical indicating whether unassigned channels should be
dropped from the returned cytoset, set to FALSE by default. Alternatively,
users can supply a vector of channels to remove, see
\code{\link{cyto_channels_restrict}} for details.}

\item{clean}{logical indicating whether the loaded data should be cleaned
using \code{cyto_clean}, set to FALSE by default. Alternatively, users can
indicate which types of anomalies should be checked as expected by
\code{remove_from} in \code{\link[flowAI:flow_auto_qc]{flow_auto_qc}}.}

\item{markers}{logical indicating whether a call should be made to
\code{cyto_markers_edit} to update the markers associated with channels in
the loaded sampes, set to TRUE by default. The name of the csv to which
these details will be supplied can also be passed to this argument.}

\item{parse_names}{logical indicating whether the file names should be parsed
into experiment details using \code{cyto_names_parse}, set to FALSE by
default. If you need to parse the names using a different dlimiter, supply
the delimiter to this argument instead of TRUE.}

\item{details}{logical indicating whether a call should be made to
\code{cyto_details_edit} to update the experimental details associated with
the loaded samples, set to TRUE by default. The name of the csv to which
these details will be supplied can also be passed to this argument.}

\item{sample}{logical indicating whether all samples should be downsampled to
the minimum number of events in a sample, set to FALSE by default.
Alternatively, users can supply a numeric to indicate the desired number of
events to keep in each sample.}

\item{...}{additional arguments passed to
\code{\link[flowWorkspace:load_cytoset_from_fcs]{load_cytoset_from_fcs}}.}
}
\value{
object of class
  \code{\link[flowWorkspace:GatingSet-class]{GatingSet}}.
}
\description{
\code{cyto_setup} takes care of all the data loading and annotation steps to
prepare your cytometry data for downstream analyses. The .fcs files are first
read into a \code{\link[flowWorkspace:cytoset]{cytoset}} using
\code{\link{cyto_load}} which is then added to a
\code{\link[flowWorkspace:GatingSet-class]{GatingSet}}.
}
\details{
Calls are then made to \code{\link{cyto_markers_edit}} and
\code{\link{cyto_details_edit}} to update the GatingSet with the details of
the experiment. These details can be modified later with additional calls to
\code{\link{cyto_markers_edit}} and/or \code{\link{cyto_details_edit}}.

Through the \code{clean} argument, the data can then be optionally cleaned
using \code{\link[flowAI:flow_auto_qc]{flow_auto_qc}} to automatically remove
anomalies in the recorded data.

Users can optionally provide a name for a gatingTemplate csv file which will
be created if necessary and assigned as the active gatingTemplate.
}
\examples{

\dontrun{
# Load in CytoExploreRData to access data
library(CytoExploreRData)

# Get path to Activation .fcs files in CytoExploreRData
datadir <- system.file("extdata", package = "CytoExploreRData")
path <- paste0(datadir, "/Activation")

# Load in .fcs files into an annotated GatingSet
gs <- cyto_setup(path)

# Markers have been assigned
cyto_extract(gs, "root")[[1]]

# Experiment details have been updated
cyto_details(gs)
}

}
\seealso{
\code{\link{cyto_load}}

\code{\link{cyto_markers_edit}}

\code{\link{cyto_names_parse}}

\code{\link{cyto_details_edit}}

\code{\link{cyto_channels_restrict}}

\code{\link{cyto_clean}}

\code{\link{cyto_gatingTemplate_select}}

\code{\link{cyto_gatingTemplate_create}}
}
\author{
Dillon Hammill, \email{Dillon.Hammill@anu.edu.au}
}
