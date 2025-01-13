# aq_get_time_series_description_list_by_unique_id works

    Code
      aq_get_time_series_description_list_by_unique_id(
        "27a6b0badd044e0c9b29d589b9e078d9")
    Output
      # A tibble: 1 x 21
        Identifier   UniqueId LocationIdentifier Parameter ParameterId Unit  UtcOffset
        <chr>        <chr>    <chr>              <chr>     <chr>       <chr>     <int>
      1 Stage.FlowW~ 27a6b0b~ CM_CCOFF           Stage     HG          m            -7
      # i 14 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>

# aq_get_time_series_description_list_by_unique_id works vector

    Code
      aq_get_time_series_description_list_by_unique_id(c(
        "27a6b0badd044e0c9b29d589b9e078d9", "11e69f80f4d6474e8f9c07b10b2b83d7"))
    Output
      # A tibble: 2 x 21
        Identifier   UniqueId LocationIdentifier Parameter ParameterId Unit  UtcOffset
        <chr>        <chr>    <chr>              <chr>     <chr>       <chr>     <int>
      1 Stage.FlowW~ 11e69f8~ CM_MC1             Stage     HG          m            -7
      2 Stage.FlowW~ 27a6b0b~ CM_CCOFF           Stage     HG          m            -7
      # i 14 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>

# aq_get_time_series_description_list_by_unique_id eliminates duplicates

    Code
      aq_get_time_series_description_list_by_unique_id(c(
        "27a6b0badd044e0c9b29d589b9e078d9", "27a6b0badd044e0c9b29d589b9e078d9"))
    Output
      # A tibble: 1 x 21
        Identifier   UniqueId LocationIdentifier Parameter ParameterId Unit  UtcOffset
        <chr>        <chr>    <chr>              <chr>     <chr>       <chr>     <int>
      1 Stage.FlowW~ 27a6b0b~ CM_CCOFF           Stage     HG          m            -7
      # i 14 more variables: UtcOffsetIsoDuration <chr>, LastModified <chr>,
      #   RawStartTime <chr>, RawEndTime <chr>, CorrectedStartTime <chr>,
      #   CorrectedEndTime <chr>, TimeSeriesType <chr>, Label <chr>, Comment <chr>,
      #   Description <chr>, Publish <lgl>, ComputationIdentifier <chr>,
      #   ComputationPeriodIdentifier <chr>, SubLocationIdentifier <chr>

