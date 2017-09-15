library(caret)

evaluate_model <- function(pred,real){
  # Evaluate
  confusionMatrix(pred, real)
}
  
