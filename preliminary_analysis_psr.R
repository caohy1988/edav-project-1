library(ggplot2)

data <- read.csv('survey_new.csv')

# Question, who is in the class? How familiar are they with R?

ggplot(data, aes(data$Program, fill = data$R)) + geom_bar() +
  xlab('Program') + ylab('Count') + labs(fill = "Proficient with R") +
  ggtitle("R Programming Proficiency by Program") +
  theme(plot.title = element_text(size = 16)) + scale_fill_manual(values = c('#e6b0c5','#b0c5e6'))

# Question, are there differences in the number of tools used by DSI MS students,
# DSI Certificate students, and everyone else. Look at mean and standard deviation.

ggplot(data, aes(x = data$Program, y = data$Number.Tools)) + geom_boxplot(fill = "#b0c5e6") +
  xlab('Program') + ylab('# Analysis Tools') + 
  ggtitle("Average Number of Analysis Tools by Program") + 
  theme(plot.title = element_text(size = 16)) 


# Reference: create new dataframes based on Program
#toolsDSIms <- mean(data[which(data[,'Program'] == 'IDSE (master)'), "Number.Tools"])
#toolsDSIcert <- mean(data[which(data[,'Program'] == 'Data Science Certification'), "Number.Tools"])
#toolsOther <- mean(data[which()])

# Reference: create new dataframe based on frequency
#inClass <- unique(data[,2])
#frequencyByProgram <- rep(0,length(inClass))

#for (i in 1:length(inClass)){
#  frequencyByProgram[i] <-length(which(data[,2] == inClass[i]))
#} 

#freqDf <- data.frame(Program=inClass,freq=frequencyByProgram)
