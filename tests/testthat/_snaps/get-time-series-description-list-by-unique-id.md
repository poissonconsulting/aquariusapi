# aq_get_time_series_description_list_by_unique_id works

    Code
      aq_get_time_series_description_list_by_unique_id(
        "27a6b0badd044e0c9b29d589b9e078d9")
    Message
      The spec contains 2 unspecified fields:
      * ExtendedAttributes
      * Thresholds
    Output
      # A tibble: 1 x 23
        Identifier   UniqueId LocationIdentifier Parameter ParameterId Unit  UtcOffset
        <chr>        <chr>    <chr>              <chr>     <chr>       <chr>     <int>
      1 Stage.FlowW~ 27a6b0b~ CM_CCOFF           Stage     HG          m            -7
      # i 16 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>,
      #   ExtendedAttributes <list>, Thresholds <list>

