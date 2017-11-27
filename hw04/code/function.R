library(stringr)

#Function remove_missing()
#Description: Removing missing values of a vector
remove_missing = function(x) {
    x[!is.na(x)]
}
a = c(4, 1, 7, NA, 10) #example
remove_missing(a)


#Function get_minimum()
#Description: Get the minimum value of a vector 
get_minimum = function(x){
    y = sort(x)
    y[1]
}
get_minimum(a) #example


#Function get_maximum()
#Description: Get the maximum value of a vector 
get_maximum = function(x){
  y = sort(x, decreasing = TRUE)
  y[1]
}
get_maximum(a) #example


#Function get_range()
#Description: Get the range of a vector 
get_range = function(x){
  z = get_maximum(x)
  v = get_minimum(x)
  y = z - v
  y
}
get_range(a) #example


#Function get_median()
#Description: Get the median of a vector 
get_median = function(x){
  y = remove_missing(x)
  quantile(y, .5)
}
get_median(a) #example


#Function get_average()
#Description: Get the average of a vector 
get_average = function(x){
  y = remove_missing(x)
  sum_entries = 0
  for (i in 1:length(y)) {
    sum_entries = sum_entries + y[i]
  }
  result = sum_entries / length(y)
  result
} 
get_average(a) #example


#Function get_stdev()
#Desciption: Get the standard deviation of a vector
get_stdev = function(x){
  y = remove_missing(x)
  deviation = 0
  for(i in 1:length(y)){
    deviation = deviation + (y[i] - get_average(y))^2
  }
  result = deviation / (length(y) - 1)
  sqrt(result)
}
get_stdev(a) #example


#Function get_quartile1()
#Description: Get the first quartile of the input vector 
get_quartile1 = function(x){
  y = remove_missing(x)
  quantile(y, .25)
}
get_quartile1(a) #example


#Funciton get_quartile3()
#Description: Get the third quartile of the input vector 
get_quartile3 = function(x){
  y = remove_missing(x)
  quantile(y, .75)
}
get_quartile3(a) #example

#Function get_percentile10()
#Description: Get the first tenth of the input vector 
get_percentile10 = function(x){
  y = remove_missing(x)
  quantile(y, .10)
}
get_percentile10(a) #example


#Function get_percentile90()
#Description: Get the last tenth of the input vector 
get_percentile90 = function(x){
  y = remove_missing(x)
  quantile(y, .90)
}
get_percentile90(a) #example


#Function count_missing()
#Description: Counts the number of missing values NA
count_missing = function(x){
  sum(length(which(is.na(x))))
}
count_missing(a) #example

#Function summary_stats()
#Description: returns a list of summary statistics
summary_stats = function(x){
   summary = list('minimum' = get_minimum(x),
              'percent10' = get_percentile10(x),
              'quartile1' = get_quartile1(x),
              'median' = get_median(x),
              'mean' = get_average(x),
              'quartile3' = get_quartile3(x),
              'percent90' = get_percentile90(x),
              'maximum' = get_maximum(x),
              'range' = get_range(x),
              'stdev' = get_stdev(x),
              'missing' = count_missing(x))
  summary
}
stats = summary_stats(a)
stats


#Function print_stats()
#Description: prints the values in a nice format
print_stats = function(x){
  sum_stats = summary_stats(x)
  for (i in 1:length(sum_stats)){
    cat(str_pad(c(names(sum_stats[i]), 
                  ":",
                  formatC(head(sum_stats[[i]]),
                          digits = 4, 
                          format = 'f')),
                width = 10.5,
                side = 'left'), '\n')
  }
}
print_stats(a) #example


#Function rescale100()
#Description: rescaled vector with a scale from 0 to 100
rescale100 = function(x, xmin, xmax){
  100 * (x - xmin) / (xmax - xmin)
}
b = c(18, 15, 16, 4, 17, 9) #example
rescale100(b, xmin = 0, xmax = 20)

sort(b)
#Function drop_lowest()
#Description: drops the lowest value of a vector 
drop_lowest = function(x){
  y = remove_missing(x)
  sort(y)[-1]
}
drop_lowest(b) #example

drop_lowest(c(100, 100, 100, 100))
#Function score_homework()
#Description: return the average of the homework 
score_homework = function(x, drop = FALSE) {
  if (is.numeric(x) == FALSE){
    return('non-numeric argument')
  }
  if (drop == TRUE) {
    x = drop_lowest(x)
  } 
  get_average(x)
}
hws = c(100, 80, 30, 70, 75, 85) #example
score_homework(hws, drop = TRUE)
score_homework(hws, drop = FALSE)


#Function score_quiz()
#Description: return the average quiz score
score_quiz = function(x, drop = FALSE){
  if (is.numeric(x) == FALSE){
    return('non-numeric argument')
  }
  if (drop == TRUE) {
    x = drop_lowest(x)
  } 
  get_average(x)
}
quizzes = c(100, 80, 70, 0) #example 
score_quiz(quizzes, drop = TRUE)
score_quiz(quizzes, drop = FALSE)


#Function score_lab()
#Description: returns lab score 
score_lab = function(x){
  if (x > 10){
    print(100)
  } else if (x == 10) {
    print(80)
  } else if (x == 9) {
    print(60)
  } else if (x == 8) {
    print(40)
  } else if (x == 7) {
    print(20)
  } else if (x < 7) {
    print(0)
  }
}
score_lab(12) #example
score_lab(10)
score_lab(6)
