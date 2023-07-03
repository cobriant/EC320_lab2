#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                 Koan #4: lm()
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To conquer this challenge:
# 1. When facing an exercise, bravely fill in the blank and prepare for action.
# 2. Liberate the code from its comment chains (Ctrl+Shift+C on Windows,
#    Cmd+Shift+C on Macs).
# 3. Then place your cursor at the end of the last line of the chunk and command
#.   it to run in the console (Ctrl/Cmd+Return).
# 4. Preserve your progress by saving (Ctrl/Cmd+S) and verifying your answers
#.   (Ctrl/Cmd+Shift+T).
# 5. Once you've achieved 100% mastery, transform your work into an html
#    treasure (Ctrl/Cmd+Shift+K) and share your spoils on Canvas!

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Attach the tidyverse to your current session get started:
library(tidyverse)

# Read the qelp docs for 'lm':
?qelp::lm

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In classwork 3, we took some sample data of X and Y and we calculated the
# OLS estimate of the intercept and slope for the line of best fit. Luckily for
# us, there's a shortcut so that we don't have to keep doing this by hand, and
# that's the function lm(). Solving the problem from classwork 3 is as easy as
# this:

tibble(
  x = 1:3,
  y = c(4, 2, 1)
) %>%
  lm(y ~ x, data = .)

# The answers match classwork 3: the estimate for the intercept is 5 1/3 and the
# estimate for the slope is -1.5.
# A couple things to notice about using lm:
# 1. You'll pipe the dataset into the second argument of lm, so you'll need to
#    use the `.` notation to indicate where you want the data to be piped into.
# 2. The first argument lm() takes is a model in the form of a formula, defined
#    using the tilde `~`. When I write `y ~ x`, I'm saying I want y as the
#    dependent variable and x as the explanatory variable.

# To unpack the residuals or the fitted values from the lm object, use the
# functions `residuals()` or `fitted.values()`:

tibble(
  x = 1:3,
  y = c(4, 2, 1)
) %>%
  lm(y ~ x, data = .) %>%
  residuals()

tibble(
  x = 1:3,
  y = c(4, 2, 1)
) %>%
  lm(y ~ x, data = .) %>%
  fitted.values()

# Take a look at the code below and then answer the questions below about it.
tibble(
  x = 1:5,
  y = c(10, 6, 3, 0, 4)
) %>%
  lm(y ~ x, data = .)

# 1. What is the dependent variable in the linear model above? Your answer
# should be a character string, so make sure to un-comment it but leave the
# quotes around it.
#01@

# "__"

#@01

# 2. What is the explanatory variable in the linear model above? Your answer
# should be a character string.
#2@

# "__"

#@2

# 3. What is the formula in the linear model above? Your answer should be a
# character string.
#3@

# "__"

#@3

# 4. What values does x take in the linear model above? Your answer should be a
# vector.
#4@

# __

#@4

# 5. What values does y take in the linear model above? Your answer should be a
# vector.
#5@

# __

#@5

# 6. What is beta hat 0 in the linear model above? Your answer should be a number.
#6@

# __

#@6

# 7. What is beta hat 1 in the linear model above? Your answer should be a number.
#7@

# __

#@7

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To solve the next few questions, run this chunk of code to download a dataset
# `students` into your environment.

students <- read_csv(
  "https://raw.githubusercontent.com/cobriant/students_dataset/main/students.csv",
  show_col_types = FALSE
)

# Run this piece of code to view the dataset in a new tab:
# view(students)

# This is some (slightly tweaked) data from high school students in Portugal.
# Each row has data about a different student: their sex, how many hours per
# week they say they're studying math, how many classes they failed the year
# prior, whether or not they're in a romantic relationship, how much alcohol
# they drink, and how many absences they had that year. `grade1` is their first
# semester grade in their math course, `grade2` is their second semester grade
# in math, and `final_grade` is their final grade in math, which we can assume
# is some function of grade1, grade2, and perhaps a final exam which is not
# observable to us.

# 8. How many students are in the dataset? Use a function on `students` to find
# the answer to this question.
#8@

# students %>% __

#@8

# Here I'll estimate the linear model: final_grade = beta0 + beta1 grade1 + u

students %>%
  lm(final_grade ~ grade1, data = .)

# The estimate for beta1 is 1.042, so the slope of the line of best fit is 1.042.
# Think about what a slope is: as the rise / run, it's the amount by which Y is
# expected to increase given a 1-unit increase in X. So the interpretation of
# betahat1 is this: when a person gets 1 point more in the first semester, their
# final grade is expected to go up by 1.042 points, on average.

# beta0 is the intercept, so the interpretation for betahat0 is the value for Y
# when X is equal to 0. So in this example, -3.861% the expected final grade of
# someone who got 0% in the first semester. Of course a negative final grade is
# not reasonable, but a 0% in the first semester is also not reasonable. This
# is what will happen when you extrapolate a line of best fit way outside its
# usual domain.

# 9. Estimate this linear model: final_grade = beta0 + beta1 grade2 + u

#9@

# students %>%
#   __

#@9

# 10. Interpret the results from the previous question by filling in the blanks.
# Un-comment your answer but leave the quotes around it so it's a character string.

#10@

# "When a person gets 1 point more in the second semester, their final grade is"
# "expected to go up by __ points, on average."

# "If a person got 0% in the second semester, we'd expect that they would get a"
# "__% as a final grade."

#@10

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.
