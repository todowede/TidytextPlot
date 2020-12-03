#' Plot of change in proportion of given word(s) over time
#'
#' This function creates a ggplot of change in proportion of given word(s)
#' over time, where time is indicated by turn
#' It calls the \code{createTidyData} function which prepares the data for plotting.
#'
#' @param word Single or combination of characters (words) for plotting
#' @param data A data.frame containing the data - Not required if supplied data is used.
#' @inheritParams createTidyData
#'
#' @return A ggplot graphic showing change in proportion of given word(s) over time.
#' @author Sewedo Abolade Todowede \email{todowede@@gmail.com}
#' @import ggplot2
#' @import scales
#' @import tidytext
#' @import dplyr
#' @export
#' @examples
#' fict_df<-data.frame(person=c("John","Todd","Texas","Rama"),
#' dialogue=c("We gather here", "meet basic needs","people of this nation", "focus on implementation"),
#' turn=c(1,2,3,4), stringsAsFactors = FALSE)
#' plotDebateWords(c("people","focus"),fict_df)
#'
plotDebateWords <- function(word=NULL,data=debateData) {
#
# Line 6 call "createTidyData.R" function to transform the debate data into tidytext data
# structure and prepare ready to plot required argument, i.e. word(s)
#
tidyData <-createTidyData(data)
#
# Lines 11-13 check if the first argument is set to null, and whenever they are not null, retrieve from the data,
# a subset given by the non-null argument. With %in%, we can use as many arguments as required.
#
  if(!is.null(word)) {
    tidyData<-tidyData[tidyData$word %in% word,]
  }
#
# Plot the data using ggplot
#
plot <- tidyData %>%
    ggplot(aes(turn,p,colour=word)) +
    geom_point() +
    geom_smooth() +
    geom_vline(xintercept = c(541,1798),
               linetype="longdash",
               colour="black",
               size=0.5) +
    facet_wrap(~word, scales="free_y") +
    scale_y_continuous(labels=scales::percent_format()) +
    xlab("Debate turn number") +
    ylab("Percentage of words in presidential debate") +
    ggtitle("Change of Word Frequency in the 2012 Presidential Debates Over Time") +
    theme(legend.position = "none")
#
return(plot)
#
}
