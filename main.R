# Load and Setup
library(caret)
setwd("text-mining")
source("clean/get_corpus.R")
source("clean/create_bow.R")

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



# Train a Naive Bayes Classifier
train_bow <- create_bow(train_corpus)
spam_nb <- textmodel_NB(train_bow, train_labels)


# Test
test_bow <- dfm_select(create_bow(test_corpus), train_bow)
spam_pred <- predict(spam_nb, newdata = test_bow)

# Evaluate
confusionMatrix(spam_pred$nb.predicted, test_labels)

## Evaluate Probabilities
probs <- spam_nb$PwGc
df <- as.data.frame(t(as.matrix(probs)))
top_non_spam <- df[tail(order(df$`non-spam`), 10) ,]
top_spam <- df[tail(order(df$`spam`), 10) ,]

## Wordclouds
textplot_wordcloud(train_bow[1:10])