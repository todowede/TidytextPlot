% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/debateData.R
\docType{data}
\name{debateData}
\alias{debateData}
\title{2012 US Presidential Debate Data Set}
\format{
A data.frame with 2912 rows and 3 columns having columns header:
\describe{
\item{person}{The speaker. Obama and Romney were the candidates, Crowlwy, Lehrer, Schieffer were moderators  and “question” indicates questions raised by the public. }
\item{dialogue}{The words spoken by each person.}
\item{turn}{Progressive number indicating the turn of talk.}
}
}
\source{
Data provided by Dr. Luciana Dalla Valle.
}
\usage{
debateData
}
\description{
The 2012 US Presidential Debate Data Set contains a cleaned version of dialogues for the three main presidential debates
}
\examples{
with(debateData, plotDebateWords("iran"))
with(debateData, plotDebateWords(c("iran","people","china"))

}
\keyword{datasets}
