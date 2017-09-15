library(caret)
library(quanteda)

naive_bayes <- function(train_bow, train_labels, test_bow){
  
  # Train a Naive Bayes Classifier
  spam_nb <- textmodel_NB(train_bow, train_labels)
  
  # Test
  spam_pred <- predict(spam_nb, newdata = test_bow)
}