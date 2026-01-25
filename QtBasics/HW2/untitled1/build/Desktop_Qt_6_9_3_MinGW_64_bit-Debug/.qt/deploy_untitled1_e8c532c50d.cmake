include("D:/Git/QtBasics/HW2/untitled1/build/Desktop_Qt_6_9_3_MinGW_64_bit-Debug/.qt/QtDeploySupport.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/untitled1-plugins.cmake" OPTIONAL)
set(__QT_DEPLOY_I18N_CATALOGS "qtbase")

qt6_deploy_runtime_dependencies(
    EXECUTABLE "D:/Git/QtBasics/HW2/untitled1/build/Desktop_Qt_6_9_3_MinGW_64_bit-Debug/untitled1.exe"
    GENERATE_QT_CONF
)
