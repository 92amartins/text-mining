library(e1071)

support_vector_machine <- function(train_bow, train_labels, test_corpus, 
                                   cost_parameter, 
                                   gamma_parameter){
  # Preparing the data
  dataset_tran <- dfm_trim(train_bow, min_docfreq = 0.05, max_docfreq = 0.9)
  dataset_test <- as.data.frame(dfm_select(create_bow(test_corpus), dataset_tran))
  dataset_tran <- convert(dataset_tran, "data.frame")

  # Set the labels on the training base
  dataset_tran$rotulo = train_labels

  # Parameter optional 
  # Default: Linear
  if(missing(cost_parameter) | missing(gamma_parameter)) {
    # Train a Support Vector Machines to classifier
    model_svm <- svm(rotulo ~ ., data = dataset_tran, type = "C", kernel = "linear")
    
  } 
  # By parameter
  else
  {
    # Train a Support Vector Machines to classifier
    model_svm <- svm(rotulo ~ ., data = dataset_tran, type = "C-classification", 
                     cost = cost_parameter, gamma = gamma_parameter)
  }
  
  
  

  result <- list("dataset_tran" = dataset_tran, "dataset_test" = dataset_test, "model_svm" = model_svm)

  return(result)
}