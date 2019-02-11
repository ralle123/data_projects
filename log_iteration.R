rm(list = ls())
temp = list.files(pattern="*.txt")
df <- data.frame(matrix(ncol = 3, nrow = 0))
#do a process
myProcess <- function(fileName){
  todayTime <- as.character(format(Sys.time(), "%y-%m-%d %H:%M %p"))
  startTime <- Sys.time()
  #do stuff
  endTime <- Sys.time()
  myTime <- as.character.Date(difftime(endTime,startTime, tz,units = c("auto")))
  df <- dataEntry(df,c(fileName,todayTime,myTime))
}

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
if (length(temp)>0){
  #start_time <- Sys.time()
  df=lapply(temp,myProcess)
  #end_time <- Sys.time()
  #process_time<-end_time - start_time
}
writeDf(df)







