#' 2012 US Presidential Debate Data Set
#'
#' The 2012 US Presidential Debate Data Set contains a cleaned version of dialogues for the three main presidential debates
#'
#' @format A data.frame with 2912 rows and 3 columns having columns header:
#' \describe{
#'  \item{person}{The speaker. Obama and Romney were the candidates, Crowlwy, Lehrer, Schieffer were moderators  and “question” indicates questions raised by the public. }
#'  \item{dialogue}{The words spoken by each person.}
#'  \item{turn}{Progressive number indicating the turn of talk.}
#' }
#'
#' @examples
#' with(debateData, plotDebateWords("iran"))
#' with(debateData, plotDebateWords(c("iran","people","china"))
#'
#' @source Data provided by Dr. Luciana Dalla Valle.
"debateData"
