# Basic configuration for Javascript
# ==================================
#

# JavascriptCore
# --------------

# Note: currently I don't know of a dedicated distributed version of JavascriptCore for Windows.

if (APPLE)

	# Note: On OSX JavascriptCore is there already for a longer time
	# as System library. Extra include directories are not necessary.
	find_library(JavascriptCore_LIBRARY JavascriptCore)

	# Note: find_library will set JavascriptCore to "JAVASCRIPTCORE_NOTFOUND"
	# in case the library is not there. "*-NOTFOUND" falsify.

	if (NOT JavascriptCore)
		message(SEND_ERROR "Could not find JavascriptCore framework.")
		unset(Javascript_JSC)
	else()
		set(Javascript_JSC TRUE)
	endif()

elseif(UNIX)

	find_file(JavascriptCore_INCLUDE_DIR JavascriptCore/JavascriptCore.h)
	find_library(JavascriptCore_LIBRARY NAMES javascriptcoregtk-3.0.0 javascriptcoregtk-1.0.0)

endif()

# V8
# -----------

find_file(v8_INCLUDE_DIR v8.h)
find_library(v8_LIBRARY v8)

if (v8_INCLUDE_DIR AND v8_LIBRARY)
	set(Javascript_V8 TRUE)
else()
	unset(Javascript_V8)
endif()

# NodeJS
# -----------

find_program(NODEJS node)
find_program(NODEGYP "node-gyp")

if (NODEJS AND NODEGYP)
	message("---- Found Node.js.")
	set(Javascript_NODE TRUE)
else()
	message("---- Could not find Node.js. ${NODEJS} ${NODEGYP}")
	unset(Javascript_NODE)
endif()


# If JSC of v8 are available build a custom interpreter
# which provides an extension mechanism (via keyword 'require')

if (Javascript_JSC OR Javascript_V8)

	add_subdirectory(interpreter)

endif()


#NOTE: IMO CMake is not very suitable for running the test-suite
# which requires building + file-system preparations + execution of external programs

#If there is any interpreter activate the Javascript test-suite
if (Javascript_JSC OR Javascript_V8 OR Javascript_NODE)

	add_subdirectory(test-suite)
endif()
