# aq_get_time_series_description_list works

    Code
      aq_get_time_series_description_list()
    Message
      The spec contains 2 unspecified fields:
      * ExtendedAttributes
      * Thresholds
    Output
      # A tibble: 2,196 x 23
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
      # i 2,186 more rows
      # i 16 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>,
      #   ExtendedAttributes <list>, Thresholds <list>

