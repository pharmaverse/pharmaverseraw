# Dataset: DM
# Description: Raw demographics dataset used to create pharmaversesdtm::dm

# Load pharmaversesdtm::dm and convert into raw dataset ----
sdtm_dm <- pharmaversesdtm::dm
dm_raw <- sdtm_dm |>
  dplyr::mutate(
    STUDY = "CDISCPILOT01",
    PATNUM = substr(USUBJID, 4, 11),
    IT.AGE = AGE,
    IT.SEX = ifelse(SEX == "F", "Female", "Male"),
    IT.ETHNIC = tools::toTitleCase(tolower(ETHNIC)),
    IT.RACE = tools::toTitleCase(tolower(RACE)),
    COUNTRY = COUNTRY,
    PLANNED_ARM = ifelse(ARM == "Xanomeline High Dose", "Xan High",
                         ifelse(ARM == "Xanomeline Low Dose", "Xan Low", ARM)),
    PLANNED_ARMCD = ARMCD,
    ACTUAL_ARM = ifelse(ACTARM == "Xanomeline High Dose", "Xan High",
                        ifelse(ACTARM == "Xanomeline Low Dose", "Xan Low", ACTARM)),
    ACTUAL_ARMCD = ACTARMCD,
    COL_DT = format(as.Date(DMDTC, format = "%Y-%m-%d"), "%m/%d/%Y"),
    IC_DT = format(as.Date(RFSTDTC, format = "%Y-%m-%d") - lubridate::days(7), "%m/%d/%Y")
  ) |>
  dplyr::select(
    STUDY, PATNUM, IT.AGE, IT.SEX, IT.ETHNIC, IT.RACE, COUNTRY,
    PLANNED_ARM, PLANNED_ARMCD, ACTUAL_ARM, ACTUAL_ARMCD, COL_DT, IC_DT
  )

for (col in names(dm_raw)) {
  attributes(dm_raw[[col]]) <- NULL
}

# Save datasets ----
usethis::use_data(dm_raw, overwrite = TRUE)
