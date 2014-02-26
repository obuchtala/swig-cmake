set(TOP ${SWIG_ROOT})
set(SOURCE_DIR ${TOP}/Tools/javascript)

if (CMAKE_BUILD_TYPE STREQUAL "Debug" )
	add_definitions(-DJAVASCRIPT_INTERPRETER_STOP)
endif()

set(javascript_interpreter_sources
	${SOURCE_DIR}/javascript.cxx
	${SOURCE_DIR}/js_shell.cxx
)

if(Javascript_V8)
	list(APPEND javascript_interpreter_sources
		${SOURCE_DIR}/v8_shell.cxx
	)

	add_definitions(-DENABLE_V8)

endif()

if(Javascript_JSC)
	list(APPEND javascript_interpreter_sources
		${SOURCE_DIR}/jsc_shell.cxx
	)
	add_definitions(-DENABLE_JSC)

endif()

add_executable(javascript_interpreter
	${javascript_interpreter_sources}
)

get_property(JAVASCRIPT_INTERPRETER TARGET javascript_interpreter PROPERTY LOCATION)
add_custom_command(TARGET javascript_interpreter POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy ${JAVASCRIPT_INTERPRETER} ${PROJECT_BINARY_DIR}/Dist
)

target_link_libraries(javascript_interpreter ${Javascript_Libraries})
