#' Adverse Events
#'
#' A raw dataset used to create pharmaversesdtm::ae
#'
#' @name ae_raw
#' @title Adverse Events Raw Dataset
#' @keywords dataset
#' @description A raw dataset used to create pharmaversesdtm::ae
#' @docType data
#' @format A data frame with 32 columns:
#'   \describe{
#'     \item{STUDY}{Study Identifier}
#'     \item{PATNUM}{Patient Number}
#'     \item{FOLDER}{Folder}
#'     \item{FOLDERL}{Folder Label}
#'     \item{IT.AETERM}{Reported Term for the Adverse Event}
#'     \item{AEOUTCOME}{Outcome of Adverse Event}
#'     \item{AELLT}{Lowest Level Term}
#'     \item{AELLTCD}{Lowest Level Term Code}
#'     \item{AEDECOD}{Dictionary-Derived Term}
#'     \item{AEPTCD}{Preferred Term Code}
#'     \item{AEHLT}{High Level Term}
#'     \item{AEHLTCD}{High Level Term Code}
#'     \item{AEHLGT}{High Level Group Term}
#'     \item{AEHLGTCD}{High Level Group Term Code}
#'     \item{AEBODSYS}{Body System or Organ Class}
#'     \item{AEBDSYCD}{Body System or Organ Class Code}
#'     \item{AESOC}{Primary System Organ Class}
#'     \item{AESOCCD}{Primary System Organ Class Code}
#'     \item{IT.AESEV}{Severity/Intensity}
#'     \item{IT.AESER}{Serious Event}
#'     \item{IT.AEREL}{Causality}
#'     \item{IT.AEACN}{Action Taken with Study Treatment}
#'     \item{AESCAN}{Involves Cancer}
#'     \item{AESCNO}{Congenital Anomaly or Birth Defect}
#'     \item{AEDIS}{Persist or Signif Disability/Incapacity}
#'     \item{IT.AESDTH}{Results in Death}
#'     \item{IT.AESHOSP}{Requires or Prolongs Hospitalization}
#'     \item{IT.AESLIFE}{Is Life Threatening}
#'     \item{AESOD}{Occurred with Overdose}
#'     \item{AEDTCOL}{Date/Time of Collection}
#'     \item{IT.AESTDAT}{Start Date/Time of Adverse Event}
#'     \item{IT.AEENDAT}{End Date/Time of Adverse Event}
#'   }
#'
#' @source [Access the source of the adverse events dataset.](https://github.com/pharmaverse/pharmaverseraw/main/data/ae_raw.rda)
#' @author Shiyu Chen
"ae_raw"
