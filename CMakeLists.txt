cmake_minimum_required(VERSION 4.2)
project(splitpdf_merge)

set(CMAKE_CXX_STANDARD 20)

find_library(FOUNDATION
        Foundation)

find_library(PDFKIT
        PDFKit)
add_executable(splitpdf_merge
        main_oc.mm
        pdfkit_manager.mm
)
target_link_libraries(${PROJECT_NAME} ${FOUNDATION} ${PDFKIT})
