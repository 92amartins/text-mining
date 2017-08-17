library(quanteda)

create_bow <- function(crps){
    # Takes a corpus and returns a bag of words
    bow <- dfm(corpus(crps),
               tolower = TRUE,
               stem = TRUE,
               remove = stopwords())
}