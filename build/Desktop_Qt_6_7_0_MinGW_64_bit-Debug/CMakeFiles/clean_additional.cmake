# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appappweatherWidgetProject_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appappweatherWidgetProject_autogen.dir\\ParseCache.txt"
  "appappweatherWidgetProject_autogen"
  )
endif()
