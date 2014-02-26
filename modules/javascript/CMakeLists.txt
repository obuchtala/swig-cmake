
if (WIN32)

elseif (APPLE)

	find_library(JavascriptCore JavascriptCore)

	# Note: find_library will set JavascriptCore to "JAVASCRIPTCORE_NOTFOUND"
	# in case the library is not there. "*-NOTFOUND" falsify.
	if (NOT JavascriptCore)
		message(SEND_ERROR "Could not find JavascriptCore framework.")
		UNSET(Javascript_JSC)
	else()
		SET(Javascript_JSC TRUE)
		LIST(APPEND Javascript_Libraries ${JavascriptCore})
	endif()

else()

endif()

add_subdirectory(interpreter)
