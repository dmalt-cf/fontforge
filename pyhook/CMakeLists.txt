add_library(fontforge_pyhook MODULE fontforgepyhook.c)
add_library(psMat_pyhook MODULE psMatpyhook.c)

set_target_properties(fontforge_pyhook PROPERTIES 
    OUTPUT_NAME "fontforge" 
    PREFIX ""
)
set_target_properties(psMat_pyhook PROPERTIES 
    OUTPUT_NAME "psMat" 
    PREFIX ""
)

if(WIN32)
    set_target_properties(fontforge_pyhook PROPERTIES SUFFIX ".pyd")
    set_target_properties(psMat_pyhook PROPERTIES SUFFIX ".pyd")
elseif(APPLE)
    set_target_properties(fontforge_pyhook PROPERTIES INSTALL_RPATH "@loader_path/lib")
    set_target_properties(psMat_pyhook PROPERTIES INSTALL_RPATH "@loader_path/lib")
else()
    set_target_properties(fontforge_pyhook PROPERTIES INSTALL_RPATH "$ORIGIN/lib")
    set_target_properties(psMat_pyhook PROPERTIES INSTALL_RPATH "$ORIGIN/lib")
endif()

target_link_libraries(fontforge_pyhook PRIVATE fontforge Python3::Module)
target_link_libraries(psMat_pyhook PRIVATE fontforge Python3::Module)

# Install the Python extensions
install(TARGETS fontforge_pyhook psMat_pyhook
        LIBRARY DESTINATION "."
        RUNTIME DESTINATION ".")

# Install the shared library
install(TARGETS fontforge
        LIBRARY DESTINATION "lib"
        RUNTIME DESTINATION "lib")
