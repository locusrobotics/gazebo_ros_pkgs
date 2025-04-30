cmake_minimum_required(VERSION 3.0.2)
project(gazebo_dev)

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

find_package(catkin REQUIRED)

catkin_package(
  CFG_EXTRAS gazebo_dev-extras.cmake
)
