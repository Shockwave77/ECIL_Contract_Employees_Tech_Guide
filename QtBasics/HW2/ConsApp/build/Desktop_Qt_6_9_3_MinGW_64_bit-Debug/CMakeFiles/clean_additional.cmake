# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\ConsApp_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\ConsApp_autogen.dir\\ParseCache.txt"
  "ConsApp_autogen"
  )
endif()
