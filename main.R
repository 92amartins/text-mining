source("clean/get_corpus.R")
source("clean/create_bow.R")
source("model/naive_bayes.R")
source("model/evaluate_model.R")

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

nb_pred <- naive_bayes(train_bow, train_labels, test_bow)
evaluate_model(nb_pred$nb.predicted, test_labels)


# ====
# SVM 

library(e1071)

x_tran <- dfm_trim(train_bow, min_docfreq = 0.05, max_docfreq = 0.9)
x_test <- as.data.frame(dfm_select(create_bow(test_corpus), x_tran))

x_tran <- convert(x_tran, "data.frame")
x_tran$rotulo = train_labels

#x_tran_bow <- create_bow(train_corpus)

svm.model <- svm(rotulo ~ ., data = x_tran, type = "C-classification")
svm.prediction <- predict(svm.model, x_test)

table(svm.prediction, test_labels)

sum(diag(table(svm.prediction, test_labels))) / length(test_labels)
