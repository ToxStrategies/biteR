#' biteR-package:  Body Intake Estimation with R (NHANES)
#' 
#' Provides tools for evaluating population-level statistics
#' for additive or nutrient intake based on NHANES dietary survey data.
#' Functionality is also included to return non-survey weighted descriptive
#' statistics on the size of the portion, per occasion.
#' 
#' @docType package
#' @name biteR-package
#'
#' @section biteR functions:
#' There are 5 user-initiated functions in this package; see the help pages
#' for documentation of each.  These steps are separated out, eventually to 
#' support a front end in which each step might include its own parameterization
#' and validation.
#'
#' param.bite(file_name = "") creates and parameterizes a bite object with the input use levels
#' and population demographics and intake data required for population estimation
#'
#' raw.bite(Bite.obj) processes the new bite object to calculate NHANES participant's
#' raw intake of the additive under study
#'
#' pop.bite(Bite.obj) processes the raw bite object and produces age/gender/total 
#' reference population daily intake, incorporating survey sampling psu, strata, and weights.
#' 
#' The function bite(file_name = "") combines all three into one transaction, to generate
#' population survey weighted descriptive statistics on the intake of a food additive.
#' 
#' The function bite.size(file_name = "") calls reduced functionality to estimate
#' only the size of the meal eaten per occasion, i.e. including no survey weighted statistics
#' on an additive consumed per day. Rather, bite.size() returns the size of the portion consumed
#' of the input food codes, per eating occasion, e.g. the typical portion size of fish.
#' 
#' The 3 seperate or 2 combined functions produce statistics in strata
#' with the following features:
#' 
#' cycles  c("09", "11")  NHANES cycle start years 2009 and 2011 are included in available data
#' 
#' age bands  c("2-80", "2-5", "6-18", "19-80", "19-29", "30-44", "45-59", "60-80")
#' 
#' gender  c("all", "female", "male")
#' 
#' per  c("user", "all") refers to values by consumer of the use vs. all particpants in the dietary survey
#' 
#' adjust  c("person", "kg") refers to information by person (no adjustment) vs. by kilo of body weight
#' 
#' rank  c("mean", ".9")  refers to calculating the mean and 90th percentile
#' 
#' These strata of intake information are produced for each use and for the total of all uses.
#' The total does not duplicate intake for food codes assigned in multiple uses; only the use 
#' associated with the highest (proportion * use level) is included.
#' @section biteR input file format:
#' The input file to param.bite(file_name = "") and the wrap-around function bite(file_name="")
#' must be a .csv file with at least these columns:
#' 
#' Food_code  An 8-digit food code
#' 
#' Proportion  A numeric 0 < Proportion <= 1.0 indicating the proportion of the food relevant to the
#' additive under study.
#' 
#' Use  The category of use to sum population statistics by, e.g. "Yogurt" or "Ice_cream"
#' 
#' Use_level  A numeric 0 < Use_level < 1.0 indicating the proportion of additive in the relevant fraction
#' of the food.  That is, the raw amount of additive consumed by a person is:
#' grams of the Food_code * Proportion * Use_level.
#' 
#' In subsequent versions it is expected that these strata and features of the input file
#' will be parameterizable by the user.
#' 
#' Bite.size() does not expect an input file with use_level, as additive intake is not estimated.
#' 
#' @import data.table car utils survey plyr
#' 
NULL
