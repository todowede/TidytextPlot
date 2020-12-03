#' Create tidytext data structure
#'
#' This function transforms a data.frame having 3-columns of "person", "dialogue"
#' and "turn" into tidytext data structure. It tokenizes the dialogue, splitting each
#' sentence in separate words and remove stopwords. It also calculates count,
#' and proportion of word(s) within each turn.
#'
#' @param data_df A data.frame containing the data
#'
#' @return A data.frame consisting turn, the tokenized dialogue, count and proportion of words within each turn.
#' \describe{
#' \item{turn}{Number indicating the turn of talk.}
#' \item{word}{The tokenized dialogue.}
#' \item{n}{The count of words per turn.}
#' \item{p}{The proportion of words per turn.}
#' }
#'
#' @author Sewedo Abolade Todowede \email{todowede@@gmail.com}
#' @import tidytext
#' @import dplyr
#' @export
#' @examples
#' fict_df<-data.frame(person=c("John","Todd","Texas","Rama"),
#' dialogue=c("We gather here", "meet basic needs","people of this nation", "focus on implementation"),
#' turn=c(1,2,3,4), stringsAsFactors = FALSE)
#' createTidyData(fict_df)
#'
createTidyData <- function(input_DF) {
#
# Lines 5-6 check that the input data is in right format, and if not, print out message
#
  if(!is.data.frame(input_DF) || any(names(input_DF) != c('person', 'dialogue', 'turn'))) {
    stop("input_DF must be a data.frame with columns 'person','dialogue' and 'turn' to continue")
  }
#
# Lines 12-13 tokenize the texts under dialogue column using the unnest_tokens function
# and transform it into a tidy data stucture. Also remove "stop words" not useful for analysis.
#
  unnest_tokens(input_DF, word, dialogue) %>%
  anti_join(stop_words) %>%
#
# Lines 17-19 work out proportion of word for each turn using the dplyr package
#
  count(turn,word) %>%
  group_by(turn) %>%
  mutate(p=n/sum(n))
#
#
}
