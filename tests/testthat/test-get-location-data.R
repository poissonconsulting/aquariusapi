test_that("tables works", {
  location_data <- aq_get_location_data("LC_DRY_WQ06_TEMP")
  expect_s3_class(chk::check_data(location_data, values = list(
    location_unique_id = "",
    location_type = "Streamflow Temperature Station",
    latitude = 50.00996165,            
    longitude =  -114.7978125,          
    utc_offset = -7L,         
    elevation = 0L,           
    elevation_units = "m",    
    location_description = "LCO Dry US of culvert/pond outflow - park in the pull out parking area Some datasets used location name DRY-WQ06"),
    exclusive = TRUE,
    order = TRUE,
    nrow = 1L), "tbl")
})
