support_vector_machines <- function(train_bow, train_labels, test_corpus){
  library(e1071)

  # Preparing the data
  dataset_tran <- dfm_trim(train_bow, min_docfreq = 0.05, max_docfreq = 0.9)
  dataset_test <- as.data.frame(dfm_select(create_bow(test_corpus), dataset_tran))
  dataset_tran <- convert(dataset_tran, "data.frame")

  # Set the labels on the training base
  dataset_tran$rotulo = train_labels

  # Train a Support Vector Machines to classifier
  model_svm <- svm(rotulo ~ ., data = dataset_tran, type = "C-classification")

  result <- list("dataset_tran" = dataset_tran, "dataset_test" = dataset_test, "model_svm" = model_svm)

  return(result)
}