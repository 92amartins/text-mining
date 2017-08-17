library(readtext)

get_corpus <- function(path){
    
    # Recursively read texts assigning filepaths as classes
    crps <- readtext(path, docvarsfrom = "filepaths", docvarnames = "class")
    
    # Replace classes for meaningful values
    crps$class <- gsub("[[:punct:][:alpha:]]+non-spam{1}[[:punct:][:alnum:]]+", "non-spam", crps$class)
    crps$class <- gsub("[[:punct:][:alpha:]]+spam{1}[[:punct:][:alnum:]]+", "spam", crps$class)
    
    crps
}
