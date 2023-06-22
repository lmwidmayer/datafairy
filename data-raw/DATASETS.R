## code to prepare datasets goes here


# sample a dataset ----

#' @title Make a dummy dataset for demonstration purposes
#'
#' @param n integer, number of observations (rows) in dataset.
#'
makeExample_df <- function(n = 10) {
  dat <- data.frame(
    id = as.factor(1:n),
    grp = as.factor(rep(c("trt", "ctrl"), length.out = n)),
    age_yrs = sample(18:30, size = n, replace = TRUE),
    gender_fmx = c(NA, sample(c("f", "m"),
      size = n - 2,
      replace = TRUE
    ), "x"),
    score_pre = round(abs(rnorm(
      n = n,
      mean = 10, sd = 5
    )))
  )
  prepost_diff <- rnorm(n = n, mean = 1, sd = 3)
  dat$score_post <- round(dat$score_pre + prepost_diff)
  return(dat)
}

makeExample_lst <- function(id, date, session_tasks, session_questionnaire) {
  lst <- list(
    id = id,
    date = date,
    session = list(
      task = session_tasks,
      questionnaire = session_questionnaire
    )
  )
  return(lst)
}



# write a dataset ----


# simple dataframe

trtctrl_df <- makeExample_df(10)
usethis::use_data(trtctrl_df, overwrite = TRUE)

# nested list

p1 <- makeExample_lst(
  id = 1,
  date = "2023-06-22",
  session_tasks = c("CBT", "VSPT"),
  session_questionnaire = c("NFC")
)
p2 <- makeExample_lst(
  id = 2,
  date = "2023-05-20",
  session_tasks = c("CBT"),
  session_questionnaire = c("NFC")
)
p_lst <- list(
  "p1" = p1,
  "p2" = p2
)
usethis::use_data(p_lst, overwrite = TRUE)
