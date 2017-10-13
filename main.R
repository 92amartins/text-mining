source("clean/get_corpus.R")
source("clean/create_bow.R")
source("model/naive_bayes.R")
source("model/support_vector_machine.R")
source("eval/evaluate_model.R")

SPAM_PATH <- "./data/spamassassin/*"

# Read texts
spam_corpus <- get_corpus(SPAM_PATH)

# Holdout - split data and labels
m <- nrow(spam_corpus)
train <- sample(1:m, 0.7*m)
train_corpus <- spam_corpus[train ,]
test_corpus <- spam_corpus[-train ,]

all_labels <- docvars(spam_corpus)$class
train_labels <- all_labels[train]
test_labels <- all_labels[-train]

train_bow <- create_bow(train_corpus)
test_bow <- dfm_select(create_bow(test_corpus), train_bow)


# ====
# Naive Bayes 

model.nb <- naive_bayes(train_bow, train_labels)
pred.nb <- predict(model.nb, newdata = test_bow)
evaluate_model(pred.nb$nb.predicted, test_labels)

# ====
# SVM (Linear)

model.svm <- support_vector_machine(train_bow, train_labels, test_corpus)
svm.prediction <- predict(model.svm$model_svm, newdata = model.svm$dataset_test)
evaluate_model(svm.prediction, test_labels)

# ====
# SVM (Radial)

model.svmRadial <- support_vector_machine(train_bow, train_labels, test_corpus,
                                           cost_parameter = 1000,
                                           gamma_parameter = 0.0001)
svmRadial.prediction <- predict(model.svmRadial$model_svm, 
                                newdata = model.svmRadial$dataset_test)
evaluate_model(svmRadial.prediction, test_labels)
