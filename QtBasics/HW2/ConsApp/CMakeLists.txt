cmake_minimum_required(VERSION 3.19)
project(ConsApp LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(ConsApp
    main.cpp
    Head.h
    test.h test.cpp
)

target_link_libraries(ConsApp
    PRIVATE
        Qt::Core
)
target_link_libraries(ConsApp PRIVATE Qt6::Core)

include(GNUInstallDirs)

install(TARGETS ConsApp
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
find_package(Qt6 REQUIRED COMPONENTS SerialPort)

# target_link_libraries(ConsApp
#     Qt6::Core
#     Qt6::SerialPort
# )
target_link_libraries(ConsApp
    PRIVATE
    #     Qt6::Core
        Qt6::SerialPort
)
