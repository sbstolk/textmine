> library("stringr", lib.loc="~/R/win-library/3.3")
> library("stringi", lib.loc="~/R/win-library/3.3")
> library("tm", lib.loc="~/R/win-library/3.3")
> words <- readLines("./filename")
> words <- scan("./wf_lost_opps.txt", character(), quote = "")
> class(words)
[1] "character"
> words <- as.vector(words)
> word_count <- stri_count_words(words)
> summary(words)
   Length     Class      Mode 
    90196 character character 
> summary(word_count)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   1.000   1.000   1.028   1.000  36.000 
> words <- paste(words, collapse=" ")
> word_source <- VectorSource(words)
> corpus <- Corpus(word_source)
> corpus <- tm_map(corpus, content_transformer(tolower))
> corpus <- tm_map(corpus, removePunctuation)
> corpus <- tm_map(corpus, stripWhitespace)
> corpus <- tm_map(corpus, removeWords, stopwords("English"))
