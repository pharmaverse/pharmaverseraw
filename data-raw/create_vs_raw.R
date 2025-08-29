# Dataset: VS
# Description: Vital Signs dataset used to create pharmaversesdtm::vs

# Load pharmaversesdtm::vs and convert into raw dataset ----
sdtm_vs <- pharmaversesdtm::vs

vs_raw1 <- sdtm_vs |>
  dplyr::arrange(USUBJID,VSDTC, VSTPTNUM) |>
  dplyr::select(STUDYID, USUBJID, VISIT, VSDTC, VSTPT, VSSTAT, VSLOC, VSPOS,
                VSTESTCD, VSORRES) |>
  tidyr::pivot_wider(
    id_cols = c(STUDYID, USUBJID, VISIT, VSDTC, VSTPT, VSSTAT, VSLOC, VSPOS),
    names_from = VSTESTCD,
    values_from = VSORRES
  )

vs_raw <- vs_raw1a |>
  dplyr::mutate(
    STUDY = "CDISCPILOT01",
    PATNUM = substr(USUBJID, 4, 11),
    INSTANCE = tools::toTitleCase(tolower(VISIT)),
    INSTANCE = gsub("Ecg", "ECG", INSTANCE),
    FORM = "VS",
    FORML = "Vital Signs",
    VTLD = format(as.Date(VSDTC, format = "%Y-%m-%d"), "%d-%b-%Y"),
    IT.HEIGHT_VSORRES = HEIGHT,
    IT.WEIGHT = WEIGHT,
    IT.TEMP = TEMP,
    IT.TEMP_LOC = dplyr::case_when(is.na(TEMP) ~ NA_character_,
      !is.na(TEMP)  ~ VSLOC,
      TRUE ~ NA_character_),
    TMPTC = tools::toTitleCase(tolower(VSTPT)),
    SYS_BP = SYSBP,
    DIA_BP = DIABP,
    SUBPOS = dplyr::case_when(is.na(TEMP) ~ VSPOS,
                       !is.na(TEMP)  ~ NA_character_,
                       TRUE ~ NA_character_)
  ) |>
  dplyr::select(
    STUDY, PATNUM, INSTANCE, FORM, FORML, VTLD, IT.HEIGHT_VSORRES,
    IT.WEIGHT, IT.TEMP, IT.TEMP_LOC, TMPTC, SYS_BP, DIA_BP,
    PULSE, SUBPOS
  )

for (col in names(vs_raw)) {
  attributes(vs_raw[[col]]) <- NULL
}

# Save datasets ----
usethis::use_data(vs_raw, overwrite = TRUE)
