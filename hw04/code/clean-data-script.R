#Title: Clean-data-script.R
#Description: Data Preparation
#Date: 11/26/17

source('function.R')

dat = read.csv("../data/raw data/rawscores.csv")

sink(file = '../output/summary-rawscores.txt')
str(dat)
for (i in 1:ncol(dat)){
  print(paste("Column", i, sep = ""))
  print(print_stats(dat[ ,i]))
}
sink()

#Replacing all missing Values
for (i in 1:nrow(dat)){
  for (j in 1:ncol(dat)){
  num = dat[[i, j]]
  if (is.na(num)){
    dat[[i, j]] = 0.0
    }
  }
}

#Rescale QZ1
QZ1_res = rescale100(dat$QZ1, xmin = 0, xmax = 12)
dat$QZ1 = QZ1_res
#Rescale QZ2
QZ2_res = rescale100(dat$QZ2, xmin = 0, xmax = 18)
dat$QZ2 = QZ2_res
#Rescale QZ3
QZ3_res = rescale100(dat$QZ3, xmin = 0, xmax = 20)
dat$QZ3 = QZ3_res
#Rescale QZ4
QZ4_res = rescale100(dat$QZ4, xmin = 0, xmax = 20)
dat$QZ4 = QZ4_res
#Rescale Test1
EX1_res = rescale100(dat$EX1, xmin = 0, xmax = 80)
dat$Test1 = EX1_res
#Rescale Test2
EX2_res = rescale100(dat$EX2, xmin = 0, xmax = 90)
dat$Test2 = EX2_res

#Variable Homework
gethws = function(x){
  hw_avg = c()
  for (i in 1:nrow(x)){
    hws = c()
    for (j in 1:9){
      hws = c(hws, x[[i, j]])
    }
    avg = score_homework(hws, drop = TRUE)
    hw_avg = c(hw_avg, avg)
  }
  return(hw_avg)
}
dat$Homework = gethws(dat)

#Variable Quiz
getquiz = function(x){
  quiz_avg = c()
  for (i in 1:nrow(x)){
    quiz = c()
    for (j in 11:14){
      quiz = c(quiz, x[[i, j]])
    }
    avg = score_quiz(quiz, drop = TRUE)
    quiz_avg = c(quiz_avg, avg)
  }
  return(quiz_avg)
}
dat$Quiz = getquiz(dat)

#Overall Grade 
getlab = function(x){
  lab_avg = c()
  for (i in 1:nrow(x)){
    lab = c()
    for (j in 10){
      lab = c(lab, x[[i, j]])
    }
    avg = score_lab(lab)
    lab_avg = c(lab_avg, avg)
  }
  return(lab_avg)
}
dat$Lab = getlab(dat)

dat$Overall = 
(.1 * getlab(dat)) + 
(.3 * dat$Homework) + 
(.15 * dat$Quiz) + 
(.2 * dat$Test1) + 
(.25 * dat$Test2)

#Variable Grade 
get_grade <- function(x) {
  grades <- c()
  for (i in 1:nrow(x)) {
    percent <- x[i, "Overall"]
    if (percent < 50) {
      grade <- "F"
    }
    if (percent >= 50) {
      grade <- "D"
    }
    if (percent >= 60) {
      grade <- "C-"
    }
    if (percent >= 70) {
      grade <- "C"
    }
    if (percent >= 77.5) {
      grade <- "C+"
    }
    if (percent >= 79.5) {
      grade <- "B-"
    }
    if (percent >= 82) {
      grade <- "B"
    }
    if (percent >= 86) {
      grade <- "B+"
    }
    if (percent >= 88) {
      grade <- "A-"
    }
    if (percent >= 90) {
      grade <- "A"
    }
    if (percent >= 95) {
      grade <- "A+"
    }
    grades <- c(grades, grade)
  }
  return (grades)
}
dat$Grade = get_grade(dat)

#exporting summary statistics
sink(file = '../output/Homework-stats.txt')
str(dat$Homework)
for (i in c(1:9, 19)){
  print(paste("Column", i, sep = ""))
  print(print_stats(dat[ ,i]))
}
sink()

sink(file = '../output/Lab-stats.txt')
str(dat$Lab)
for (i in 19){
  print(paste("Lab"))
  print(print_stats(dat[ ,i]))
}
sink()

sink(file = '../output/Quiz-stats.txt')
str(dat$Quiz)
for (i in c(11:14, 20)){
  print(paste("Quiz", i, sep = ""))
  print(print_stats(dat[ ,i]))
}
sink()

sink(file = '../output/Test1-stats.txt')
str(dat$Test1)
for (i in 15){
  print(paste("Ex", 1, sep = ""))
  print(print_stats(dat[ ,i]))
}
sink()

sink(file = '../output/Test2-stats.txt')
str(dat$Test2)
for (i in 16){
  print(paste("EX", 2, sep = ""))
  print(print_stats(dat[ ,i]))
}
sink()

sink(file = '../output/Overall-stats.txt')
str(dat$Overall)
for (i in c(22)){
  print(paste("Overall"))
  print(print_stats(dat[ ,i]))
}
sink()

sink(file = '../output/summary_cleanscores.txt')
str(dat)
sink()

#export clean data frame
write.csv(dat, 
          file = '../data/clean data/cleanscores.csv', 
          row.names = FALSE)


