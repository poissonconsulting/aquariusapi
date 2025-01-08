test_that("tables works", {
  location_data <- aq_get_location_data("LC_DRY_WQ06_TEMP")
  expect_s3_class(chk::check_data(location_data, values = list(
    UniqueId = "",
    LocationType = "Streamflow Temperature Station",
    Latitude = 50.00996165,            
    Longitude =  -114.7978125,          
    UtcOffset = -7L,         
    Elevation = 0,           
    ElevationUnits = "m",    
    Description = "LCO Dry US of culvert/pond outflow - park in the pull out parking area Some datasets used location name DRY-WQ06"),
    exclusive = TRUE,
    order = TRUE,
    nrow = 1L), "tbl")
})
