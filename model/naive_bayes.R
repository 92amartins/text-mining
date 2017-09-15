library(caret)
library(quanteda)

naive_bayes <- function(train_bow, train_labels, test_bow){
  # Train a Naive Bayes Classifier
  textmodel_NB(train_bow, train_labels)
}