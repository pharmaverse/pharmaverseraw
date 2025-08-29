#' Vital Signs
#'
#' A raw dataset used to create pharmaversesdtm::vs
#'
#' @name vs_raw
#' @title Vital Signs Raw Dataset
#' @keywords dataset
#' @description A raw dataset used to create pharmaversesdtm::vs
#' @docType data
#' @format A data frame with 15 columns:
#'   \describe{
#'     \item{STUDY}{Study Identifier}
#'     \item{PATNUM}{Patient Number}
#'     \item{INSTANCE}{Folder}
#'     \item{FORM}{Form}
#'     \item{FORML}{Form Label}
#'     \item{VTLD}{Vital Signs Collection Date}
#'     \item{IT.HEIGHT_VSORRES}{Height}
#'     \item{IT.WEIGHT}{Weight}
#'     \item{IT.TEMP}{Temperature}
#'     \item{IT.TEMP_LOC}{Temperature Location}
#'     \item{TMPTC}{Timepoint}
#'     \item{SYS_BP}{Systolic Blood Pressure}
#'     \item{DIA_BP}{Diastolic Blood Pressure}
#'     \item{PULSE}{Pulse}
#'     \item{SUBPOS}{Subject Position}
#'   }
#'
#' @source [Access the source of the vital signs dataset.](https://github.com/pharmaverse/pharmaverseraw/blob/main/data/vs_raw.rda)
#' @author Shiyu Chen & Rammprasad Ganapathy
"vs_raw"
