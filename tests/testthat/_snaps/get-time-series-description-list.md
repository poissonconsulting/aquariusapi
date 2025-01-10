# aq_get_time_series_description_list works

    Code
      aq_get_time_series_description_list()
    Output
      # A tibble: 2,198 x 21
         Identifier  UniqueId LocationIdentifier Parameter ParameterId Unit  UtcOffset
         <chr>       <chr>    <chr>              <chr>     <chr>       <chr>     <int>
       1 Stage.Flow~ 27a6b0b~ CM_CCOFF           Stage     HG          m            -7
       2 Stage.Flow~ 11e69f8~ CM_MC1             Stage     HG          m            -7
       3 Discharge.~ 5b70e83~ EV_ER1             Discharge QR          m^3/s        -7
       4 Stage.CM_W~ 0bb7d22~ 1                  Stage     HG          m            -7
       5 Water Temp~ 1e8d508~ EV_ER1             Water Te~ TW          degC         -7
       6 Stage.Flow~ 6f92f06~ CM_WC1             Stage     HG          m            -7
       7 Stage.Tele~ 34d3509~ CM_WC1             Stage     HG          m            -7
       8 Stage.Flow~ e7f55a9~ EV_BC1A            Stage     HG          m            -7
       9 Stage.Flow~ e8e3ca3~ EV_HC1             Stage     HG          m            -7
      10 Stage.Tele~ f91f724~ FR_CC1             Stage     HG          m            -7
      # i 2,188 more rows
      # i 14 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>

# aq_get_time_series_description_list parameter

    Code
      aq_get_time_series_description_list(parameter = "Water Temperature")
    Output
      # A tibble: 1,279 x 21
         Identifier  UniqueId LocationIdentifier Parameter ParameterId Unit  UtcOffset
         <chr>       <chr>    <chr>              <chr>     <chr>       <chr>     <int>
       1 Water Temp~ 1e8d508~ EV_ER1             Water Te~ TW          degC         -7
       2 Water Temp~ 061328d~ FR_CAS2            Water Te~ TW          degC         -7
       3 Water Temp~ 43a442e~ FR_CASW3           Water Te~ TW          degC         -7
       4 Water Temp~ 3c3f39d~ 08NK022            Water Te~ TW          degC         -7
       5 Water Temp~ 014883f~ GH_GH1B            Water Te~ TW          degC         -7
       6 Water Temp~ 10953a3~ FR_CAS3            Water Te~ TW          degC         -7
       7 Water Temp~ babd980~ FR_CAS5            Water Te~ TW          degC         -7
       8 Water Temp~ 2568432~ FR_CAS6            Water Te~ TW          degC         -7
       9 Water Temp~ 60ee362~ FR_CASW2A          Water Te~ TW          degC         -7
      10 Water Temp~ f65a47a~ FR_CASW5A          Water Te~ TW          degC         -7
      # i 1,269 more rows
      # i 14 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>

# aq_get_time_series_description_list works location_identifier

    Code
      aq_get_time_series_description_list("LC_DRY_WQ06_TEMP")
    Output
      # A tibble: 5 x 21
        Identifier   UniqueId LocationIdentifier Parameter ParameterId Unit  UtcOffset
        <chr>        <chr>    <chr>              <chr>     <chr>       <chr>     <int>
      1 Water Tempe~ d79dd31~ LC_DRY_WQ06_TEMP   Water Te~ TW          degC         -6
      2 Water Tempe~ b1f6c30~ LC_DRY_WQ06_TEMP   Water Te~ TW          degC         -6
      3 Water Tempe~ 579b076~ LC_DRY_WQ06_TEMP   Water Te~ TW          degC         -6
      4 Water Tempe~ 1e05e21~ LC_DRY_WQ06_TEMP   Water Te~ TW          degC         -6
      5 Water Tempe~ 2e93763~ LC_DRY_WQ06_TEMP   Water Te~ TW          degC         -6
      # i 14 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>

# aq_get_time_series_description_list works no rows

    Code
      aq_get_time_series_description_list("LC_DRY_WQ06_TEMP", parameter = "Discharge")
    Output
      # A tibble: 0 x 21
      # i 21 variables: Identifier <chr>, UniqueId <chr>, LocationIdentifier <chr>,
      #   Parameter <chr>, ParameterId <chr>, Unit <chr>, UtcOffset <int>,
      #   UtcOffsetIsoDuration <chr>, LastModified <chr>, RawStartTime <chr>,
      #   RawEndTime <chr>, CorrectedStartTime <chr>, CorrectedEndTime <chr>,
      #   TimeSeriesType <chr>, Label <chr>, Comment <chr>, Description <chr>,
      #   Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>

