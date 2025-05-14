# Dataset: EX
# Description: Raw exposure as collected dataset used to create pharmaversesdtm::ex

# Load pharmaversesdtm::ex and convert into raw dataset ----
sdtm_ex <- pharmaversesdtm::ex
ec_raw <- sdtm_ex |>
  dplyr::mutate(
    STUDY = "CDISCPILOT01",
    PATNUM = substr(USUBJID, 4, 11),
    VISITNAME = tools::toTitleCase(tolower(VISIT)),
    FOLDER = "EC",
    FOLDERL = "Exposure as Collected",
    IT.ECREFID = "123",
    DRUGAD = EXTRT,
    IT.ECSTDAT = format(as.Date(EXSTDTC, format = "%Y-%m-%d"), "%d-%b-%Y"),
    IT.ECENDAT = ifelse(is.na(EXENDTC), NA_character_,
      format(as.Date(EXENDTC, format = "%Y-%m-%d"), "%d-%b-%Y")
    ),
    IT.ECDSTXT = EXDOSE,
    IT.ECDOSU = "Milligram",
    DOSFM = tolower(EXDOSFRM),
    DOSFRQ = "Daily",
    IT.ECROUTE = tools::toTitleCase(tolower(EXROUTE))
  ) |>
  dplyr::select(
    STUDY, PATNUM, VISITNAME, FOLDER, FOLDERL, IT.ECREFID, DRUGAD,
    IT.ECSTDAT, IT.ECENDAT, IT.ECDSTXT, IT.ECDOSU, DOSFM, DOSFRQ, IT.ECROUTE
  )

for (col in names(ec_raw)) {
  attributes(ec_raw[[col]]) <- NULL
}

# Save datasets ----
usethis::use_data(ec_raw, overwrite = TRUE)
