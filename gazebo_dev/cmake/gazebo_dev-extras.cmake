# Check which version of ubuntu we are running
find_program(LSB_RELEASE_EXEC lsb_release)
execute_process(COMMAND ${LSB_RELEASE_EXEC} --codename --short
    OUTPUT_VARIABLE OS_CODENAME
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# Exit if we're not building on jammy
if (NOT OS_CODENAME STREQUAL "jammy")
  message(STATUS "Detected Ubuntu version different than jammy, not building this package ")
  return()
endif()

# Depend on system install of Gazebo
find_package(gazebo REQUIRED)

message(STATUS "Gazebo version: ${GAZEBO_VERSION}")

# The following lines will tell catkin to add the Gazebo directories and libraries to the
# respective catkin_* cmake variables.
set(gazebo_dev_INCLUDE_DIRS ${GAZEBO_INCLUDE_DIRS})
set(gazebo_dev_LIBRARY_DIRS ${GAZEBO_LIBRARY_DIRS})
set(gazebo_dev_LIBRARIES ${GAZEBO_LIBRARIES})

# Append gazebo CXX_FLAGS to CMAKE_CXX_FLAGS (c++11)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GAZEBO_CXX_FLAGS}")
