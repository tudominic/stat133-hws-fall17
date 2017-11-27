#test script 
library(testthat)
library(stringr)

#source in functions to be tested 
setwd('/Users/DominicTu/Desktop/stat133/stat133-hws-fall17/hw04/code')
source('function.R')


#Function remove_missing()
context("Removing NA")
test_that("No NA",{
  c = c(1, 4, 6, 13, NA)
  ex = remove_missing(c)
  expect_that(ex, is_a("numeric"))
  expect_that(length(ex), is_less_than(length(c)))
  expect_that(length(ex), equals(4))
  expect_that(count_missing(ex), equals(0))
})

#Function get_minimum()
context("Min of a Vector")
test_that("Get Min",{
  c = c(1, 4, 6, 13, NA)
  ex = get_minimum(c)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(1))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(c)))
})

#Function get_maximum()
context("Max of a Vector")
test_that("Get Max",{
  c = c(1, 4, 6, 13, NA)
  ex = get_maximum(c)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(13))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_more_than(get_minimum(c)))
})

#Function get_range
context("Range of a Vector")
test_that("Get Range",{
  c = c(1, 4, 6, 13, NA)
  ex = get_range(c)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(12))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(c)))
})

#Function get_median()
context("Median of a Vector")
test_that("Get Median",{
  d = c(1, 4, 6, 13, 17, NA)
  ex = get_median(c)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, is_more_than(get_quartile1(d)))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(d)))
})

#Function get_average()
context("Average of a Vector")
test_that("Get Average",{
  c = c(1, 4, 6, 13, NA)
  ex = get_average(c)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(6))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(c)))
})

#Function get_stdev()
context("Standard Deviation of a Vector")
test_that("Get Standard Deviation",{
  c = c(1, 4, 6, 13, NA)
  ex = get_stdev(c)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(sd(remove_missing(c))))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(var(remove_missing(c))))
})

#Function get_quartile1()
context("First Quarter of a Vector")
test_that("Get Quartile1",{
  d = c(1, 4, 6, 13, 17, NA)
  ex = get_quartile1(d)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, is_more_than(get_minimum(d)))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_median(d)))
})

#Function get_quartile3()
context("Third Quarter of a Vector")
test_that("Get Quartile1",{
  d = c(1, 4, 6, 13, 17, NA)
  ex = get_quartile3(d)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, is_more_than(get_median(d)))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(d)))
})

#Function get_percentile10()
context("First Tenth of a Vector")
test_that("Get First Tenth",{
  d = c(1, 4, 6, 13, 17, NA)
  ex = get_percentile10(d)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, is_more_than(get_minimum(d)))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_median(d)))
})

#Function get_percentile90()
context("Last Tenth of a Vector")
test_that("Get Last Tenth",{
  d = c(1, 4, 6, 13, 17, NA)
  ex = get_percentile90(d)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, is_more_than(get_median(d)))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(d)))
})

#Function count_missing()
context("Number of Missing Numbers")
test_that("Count Missing Numbers",{
  e = c(1, 4, 6, NA, 13, 17, NA)
  ex = count_missing(e)
  expect_that(ex, is_a("integer"))
  expect_that(ex, is_more_than(0))
  expect_that(length(ex), equals(1))
  expect_that(ex, equals(2))
})

#Function summary_stats()
context("Summary of Statistics")
test_that("Get the Summary Statistics",{
  d = c(1, 4, 6, 13, 17, NA)
  ex = summary_stats(d)
  expect_that(ex, is_a("list"))
  expect_that(length(ex), equals(11))
  expect_that(length(ex), 
              is_more_than(6))
  expect_that(length(ex), 
              is_less_than(12))
})

#Function rescale100()
context("Rescale elements of a vector to a scale from 0 to 100")
test_that("Rescale to 0 to 100",{
  d = c(1, 4, 6, 13, 17, NA)
  ex = rescale100(d, xmin = 0, xmax = 20)
  expect_that(ex, is_a("numeric"))
  expect_that(ex[5], equals(85))
  expect_that(length(ex), equals(6))
  expect_that(get_maximum(ex), is_less_than(101))
})

#Function drop_lowest()
context("Drop the lowest numeric element of a vector")
test_that("Drop the Lowest Number",{
  k = c(1, 4, 6, 13, 17)
  ex = drop_lowest(k)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(c(4, 6, 13, 17)))
  expect_that(length(ex), equals(4))
  expect_that(drop_lowest(c(2, 10, 1.2)),
              equals(c(2, 10)))
})

#Function score_homework()
context("Find the Average Score with the Option to Drop the lowest score")
test_that("Get the Average Score",{
  f = c(10, 90, 80, 10, 100, 70)
  ex = score_homework(f, drop = TRUE)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(85))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(f)))
})

#Function score_quiz()
context("Find the Average Score with the Option to Drop the lowest score")
test_that("Get the Average Score",{
  g = c(10, 90, 80, 15, 100, 70)
  ex = score_quiz(g, drop = TRUE)
  expect_that(ex, is_a("numeric"))
  expect_that(ex, equals(71))
  expect_that(length(ex), equals(1))
  expect_that(ex, is_less_than(get_maximum(f)))
})

#Function score_lab()
context("Find the Corresponding Lab Score")
test_that("Get the Score",{
  expect_that(score_lab(12),
              is_a("numeric"))
  expect_that(score_lab(12), 
              equals(100))
  expect_that(length(score_lab(7)),
                     equals(1))
  expect_that(score_lab(3), 
              equals(0))
})

