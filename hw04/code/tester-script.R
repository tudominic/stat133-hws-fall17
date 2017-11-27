#test script
library(testthat)
library(stringr)

#source in functions to be tested 
source('function.R')

sink('../output/test-reporter.txt')
test_file('tests.R')
sink()