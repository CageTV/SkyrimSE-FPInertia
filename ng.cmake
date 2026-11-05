# FPInertia.dll on alandtse's CommonLibSSE-NG (Skyrim 1.6.1170 and 1.7.x, SE and AE); included by E:/WorkSpace/ng-build/CMakeLists.txt (see ng_plugin there).
# The root CMakeLists.txt is the original build (powerof3-style CommonLibSSE in extern/).
ng_plugin(TARGET FPInertia NAME FPInertia VERSION 1.3.2 AUTHOR "TheShinyHaxorus" ROOT "${CMAKE_CURRENT_LIST_DIR}"
    SOURCES src/main.cpp src/Settings.cpp src/Inertia.cpp src/Menu.cpp src/InertiaPresets.cpp
    INCLUDES "${CMAKE_CURRENT_LIST_DIR}/src"
    PCH "${CMAKE_CURRENT_LIST_DIR}/src/PCH.h"
    DEFINES FPI_NG
    LIBS nlohmann_json::nlohmann_json)
