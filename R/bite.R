#' @title Body Intake Estimate
#' @usage
#' bite(file_name = "")
#' @description
#' Given an input file of food codes and additive levels, returns matrices of population intake statistics
#' based on NHANES dietary survey data. Currently hard-coded to use a combination of the NHANES 09/10 
#' and NHANES 11/12 dietary data.
#' @details
#' This function reads an input file of food codes, use, relevant proportion of the food code, and
#' additive use level and produces population intake statistics for strata (strata definitions
#' are currently hard-coded).
#' 
#' See biteR-package help >package?biteR for details of strata and input file format requirements.
#' In subsequent versions it is expected that these strata and features of the input file
#' will be parameterizable by the user.
#' 
#' This function is a wrap-around for 3 underlying steps in the BITE process:
#' param.bite(file_name = ""), raw.bite(x), and pop.bite(x)
#' 
#' This function is for estimating (sub)population average daily intake levels. To estimate
#' average size(gr) consumed of a food in any eating occasion, please see bite.size().
#' @param file_name  Name of input .csv file containing additive uses and use level by food code.  
#' See help >package?biteR for input file requirements.
#' type  "amt" or "size" to define what is being estimated: amount of the food consumed or 
#' size of the portion consumed
#' @return 3 matrices of population stats containing all strata, one for each:  full, female, and male
#' @export

bite <- function(file_name = "") {
  
  Bite <- param.bite(file_name = file_name, type = "amt")
  Raw <- raw.bite(Bite)
  return(pop.bite(Raw))
}
