# Dataset: VS
# Description: Vital Signs dataset used to create pharmaversesdtm::vs

# Load pharmaversesdtm::vs and convert into raw dataset ----
sdtm_vs <- pharmaversesdtm::vs

vs_raw1 <- sdtm_vs |>
  dplyr::filter(VSTESTCD %in% c("HEIGHT", "WEIGHT", "TEMP")) |>
  tidyr::pivot_wider(
    id_cols = c(STUDYID, USUBJID, VISIT, VSDTC),
    names_from = VSTESTCD,
    values_from = VSORRES
  )

vs_raw2 <- sdtm_vs |>
  dplyr::filter(!VSTESTCD %in% c("HEIGHT", "WEIGHT", "TEMP")) |>
  tidyr::pivot_wider(
    id_cols = c(STUDYID, USUBJID, VSPOS, VSLOC, VISIT, VSDTC, VSTPT, VSTPTREF),
    names_from = VSTESTCD,
    values_from = VSORRES
  )

vs_raw <- dplyr::left_join(vs_raw2, vs_raw1)|>
  dplyr::mutate(
    STUDY = "CDISCPILOT01",
    PATNUM = substr(USUBJID, 4, 11),
    INSTANCE = tools::toTitleCase(tolower(VISIT)),
    INSTANCE = gsub("Ecg", "ECG", INSTANCE),
    FORM = "VS",
    FORML = "Vital Signs",
    TMPTC = tools::toTitleCase(tolower(VSTPT)),
    VTLD = format(as.Date(VSDTC, format = "%Y-%m-%d"), "%d-%b-%Y"),
    SUBPOS = tolower(VSPOS),
    SYS_BP = SYSBP,
    DIA_BP = DIABP,
    LOC = VSLOC
  ) |>
  dplyr::select(
    STUDY, PATNUM, INSTANCE, FORM, FORML, TMPTC, VTLD,
    SUBPOS, LOC, SYS_BP, DIA_BP, HEIGHT, WEIGHT, TEMP, PULSE
  )

for (col in names(vs_raw)) {
  attributes(vs_raw[[col]]) <- NULL
}

# Save datasets ----
usethis::use_data(vs_raw, overwrite = TRUE)
