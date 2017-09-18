library(wordcloud)

PlotCloud <- function(words, freqs){
  pal <- brewer.pal(9,"Blues")
  wordcloud(words, freqs)
}
