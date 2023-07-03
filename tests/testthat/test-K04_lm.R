K04 <- read_file("../../R/K04_lm.R")

test_that("K04: Question 1", {
  skip_incomplete(K04, "01")
  expect_true(parse_eval(str_match_q(K04, "01")) == "y")
})

test_that("K04: Question 2", {
  skip_incomplete(K04, "2")
  expect_true(parse_eval(str_match_q(K04, "2")) == "x")
})

test_that("K04: Question 3", {
  skip_incomplete(K04, "3")
  expect_true(parse_eval(str_match_q(K04, "3")) == "y ~ x")
})

test_that("K04: Question 4", {
  skip_incomplete(K04, "4")
  expect_true(all(parse_eval(str_match_q(K04, "4")) == 1:5))
})

test_that("K04: Question 5", {
  skip_incomplete(K04, "5")
  expect_true(all(parse_eval(str_match_q(K04, "5")) == c(10, 6, 3, 0, 4)))
})

test_that("K04: Question 6", {
  skip_incomplete(K04, "6")
  expect_true(parse_eval(str_match_q(K04, "6")) == 10)
})

test_that("K04: Question 7", {
  skip_incomplete(K04, "7")
  expect_true(parse_eval(str_match_q(K04, "7")) == -1.8)
})

test_that("K04: Question 8", {
  skip_incomplete(K04, "8")
  expect_true(parse_eval(str_match_q(K04, "8")) == 374)
})

test_that("K04: Question 9", {
  skip_incomplete(K04, "9")
  expect_true(near(coefficients(parse_eval(str_match_q(K04, "9")))[[1]], -7, tol = 0.1))
})

test_that("K04: Question 10", {
  skip_incomplete(K04, "10")
  expect_true(all(
    str_detect(str_match_q(K04, "10"), "-7.04"),
    str_detect(str_match_q(K04, "10"), "1.089")))
})

