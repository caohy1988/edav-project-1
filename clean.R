library(gdata)

data <- as.data.frame(read.xls('Survey Response.xlsx'))

#looks like there are several columns with NAs, some with more NAs than others
omits <-c()

# Remove empty columns
for (col in colnames(data)){
  if (length(data[which(is.na(data[,col])),col]) == dim(data)[1]){
    omits <- c(omits, col)
  }
}

data <- data[,!(colnames(data) %in% omits)]

# Standardize text from program column
data$Program[data$Program == "Ms in ds"] = "IDSE (master)"
data$Program[data$Program == "MSDS"] = "IDSE (master)"
data$Program[data$Program == "Data Science"] = "IDSE (master)"
data$Program[data$Program == "QMSS (master)"] = "QMSS"

# Add factor levels for each skill
temp = strsplit(as.character(data$Experiences.with.tools),split = ', ')
tool_name = unique(unlist(temp))

for (i in 1:dim(data)[1]){
  for (j in 1:length(tool_name)){
    if (tool_name[j] %in% strsplit(as.character(data$Experiences.with.tools),split = ', ')[[i]]){
      data[i,tool_name[j]] = TRUE
    }
    else{
      data[i,tool_name[j]] = FALSE
    }
  }
}

# Add a number of tools column
for (i in 1:dim(data)[1]){
  data[i,'Number.Tools'] <- length(strsplit(as.character(data$Experiences.with.tools),split = ', ')[[i]])
}

# Remove column hosting set of tools
data <-data[,!(colnames(data) %in% 'Experiences.with.tools')]

write.csv(data, "survey_new.csv",row.names = FALSE)
