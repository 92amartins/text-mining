# Introdução à categorização de textos

A categorização é a tarefa de rotular textos em linguagem natural de acordo com categorias pré-definidas [1]. Uma de suas aplicações mais tradicionais é a **detecção de spam**.

Na detecção de spam, pode-se categorizar os e-mails (textos) em duas classes (spam, não-spam).

Este repositório contém um exemplo de solução para o problema da detecção de spam por meio do uso de algoritmos de aprendizagem de máquina que, após serem apresentados a alguns exemplos previamente rotulados, são capazes de aprender e rotular automaticamente novos e-mails sem intervenção humana.

## Base de Dados

A [base de dados](http://spamassassin.apache.org/old/publiccorpus/) utilizada é a disponibilizada pelo detector de spam *open source* [SpamAssassin](http://spamassassin.apache.org/index.html).

## Algoritmos utilizados

- Naive Bayes
- SVM Linear
- SVM RBF

## Referências
1. SEBASTIANI, Fabrizio. Machine learning in automated text categorization. ACM computing surveys (CSUR), v. 34, n. 1, p. 1-47, 2002.
