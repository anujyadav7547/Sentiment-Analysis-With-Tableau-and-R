# check R version
sessionInfo() 
#set up a Rserve that will allow you to access R’s functionalities from within Tableau

install.packages("Rserve")
library(Rserve)
Rserve()

#install an R sentiment analysis package
install.packages("syuzhet")
library(syuzhet)

#read the description file
fDescription <- read_xlsx("E:/UTD/Workspace/Tableau/Sentiment Analysis with Tableau/Tweets for Test.xlsx")
keeps <- "Description"

#drop all columns except Description
fDescription <- fDescription[,keeps,drop=TRUE]

#add sentiment scores
fDescription["Sentiment_Score"] <- get_sentiment(fDescription$Description,method = "syuzhet",path_to_tagger = NULL)


