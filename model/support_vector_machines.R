library(e1071)

function(train_bow, train_labels, test_corpus){

  # Preparing the data
  x_tran <- dfm_trim(train_bow, min_docfreq = 0.05, max_docfreq = 0.9)
  x_test <- as.data.frame(dfm_select(create_bow(test_corpus), x_tran))
  x_tran <- convert(x_tran, "data.frame")

  # Set the labels on the training base
  x_tran$rotulo = train_labels

  # Train a Support Vector Machines to classifier
  svm_model <- svm(rotulo ~ ., data = x_tran, type = "C-classification")
}