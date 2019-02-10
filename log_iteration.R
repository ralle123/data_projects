rm(list = ls())
temp = list.files(pattern="*.txt")
df <- data.frame(matrix(ncol = 3, nrow = 0))
myFile <- temp[1]


todayTime <- as.character(format(Sys.time(), "%y-%m-%d %H:%M %p"))
startTime <- Sys.time()
endTime <- Sys.time()

dataEntry <- function(df,myData){
  #data added to df
  df <- rbind(df, myData)
  return(df)
}
writeDf <- function(df){
  #df writen to log
  x <- c('file_name', 'date','time')
  colnames(df) <- x
  tDate <- as.character(format(Sys.time(), "%m_%d"))
  write.csv(df,file=paste0("log",tDate,".csv"))
}
myTime <- as.character.Date(difftime(endTime,startTime, tz,units = c("auto")))
df <- dataEntry(df,c(myFile,todayTime,myTime))
writeDf(df)







