evaluate_model <- function(pred,real){
  conf <- table(pred,real)
  print(conf)
  sprintf("Acurácia = %.3f", sum(diag(conf)) / sum(conf))
}
  
