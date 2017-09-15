library(quanteda)

create_bow <- function(corpus){
    # Takes a corpus and returns a bag of words
    bow <- dfm(corpus(corpus),
               tolower = TRUE, remove_numbers = TRUE, remove_punct = TRUE, 
               remove_symbols = TRUE, remove_twitter = TRUE,
               remove = stopwords())
}