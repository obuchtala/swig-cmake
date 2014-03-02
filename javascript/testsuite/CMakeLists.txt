set(TESTROOT_JAVASCRIPT ${SWIG_TESTSUITE_ROOT}/javascript)

if (Javascript_NODE)

	  # shut up some warnings
	  # contract macro has an empty 'else' at the end...
	set(aggregate_GYP_CFLAGS "-Wno-empty-body")
  	set(contract_GYP_CFLAGS "-Wno-empty-body")

	# dunno... ignoring generously
	set(apply_signed_char_GYP_CFLAGS "-Wno-ignored-qualifiers")
	set(constant_pointers_GYP_CFLAGS "-Wno-ignored-qualifiers")
	set(enum_thorough_GYP_CFLAGS "-Wno-ignored-qualifiers")

	function(create_node_test _NAME _IS_CPP _OUTVAR)

		if (_IS_CPP)
			set(_BUILDDIR ${CMAKE_CURRENT_BINARY_DIR}/${_NAME})
			set(_WRAPPER_FILE ${_BUILDDIR}/${_NAME}_wrap.cxx)
			set(_SWIG_OPT -c++)
		else()
			set(_BUILDDIR ${CMAKE_CURRENT_BINARY_DIR}/${_NAME})
			set(_WRAPPER_FILE ${_BUILDDIR}//${_NAME}_wrap.c)
		endif()
		set(_TESTDIR_STAMP ${_BUILDDIR}/.stamp)
		set(_INTERFACE_FILE ${SWIG_TESTSUITE_ROOT}/${_NAME}.i)
		set(_SWIG_OPT ${_SWIG_OPT} -javascript -node)
		set(_RUN_STAMP ${_BUILDDIR}/.run-stamp)
		set(_TEST_RUNNER ${TESTROOT_JAVASCRIPT}/${_NAME}_runme.js)
		set(_NODE_MODULE ${_BUILDDIR}/build/Release/${_NAME}.node)
		set(_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/binding.gyp.in
					 ${CMAKE_CURRENT_SOURCE_DIR}/index.js.in
		)

		file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${_NAME})

		add_custom_command(OUTPUT ${_NODE_MODULE}
			# setup
			COMMAND ${CMAKE_COMMAND} -DSOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}
				-DTEST_NAME=${_NAME} -DGYP_CFLAGS=${${_NAME}_GYP_CFLAGS}
				-P ${CMAKE_CURRENT_SOURCE_DIR}/node_setup.cmake

			# create wrapper
			COMMAND ${SWIG_EXECUTABLE} ${_SWIG_OPT} -o ${_WRAPPER_FILE} ${_INTERFACE_FILE} 

			# build
			COMMAND node-gyp configure build

			WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${_NAME}

			DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/binding.gyp.in
			        ${CMAKE_CURRENT_SOURCE_DIR}/index.js.in
			        ${_INTERFACE_FILE}
		)

		# run
		if (EXISTS ${_TEST_RUNNER})
			add_custom_command(OUTPUT ${_RUN_STAMP}
				COMMAND ${CMAKE_COMMAND} -E copy ${_TEST_RUNNER} ${CMAKE_CURRENT_BINARY_DIR}/
				COMMAND node ${_NAME}_runme.js
				COMMAND ${CMAKE_COMMAND} -E touch ${_RUN_STAMP}
				DEPENDS ${_NODE_MODULE}
				WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
			)
			list(APPEND _SOURCES ${_TEST_RUNNER})
			set(${_OUTVAR} ${_RUN_STAMP} PARENT_SCOPE)
		else()
			# if there is no runner just check if the build is successful
			set(${_OUTVAR} ${_NODE_MODULE} PARENT_SCOPE)
		endif()

	endfunction()

	set(_TARGET_DEPENDENCIES )

	foreach(_NAME IN LISTS SWIG_CPP_TEST_CASES)
		create_node_test(${_NAME} TRUE _DEPENDENCY)
		list(APPEND _TARGET_DEPENDENCIES ${_DEPENDENCY})
	endforeach()

	foreach(_NAME IN LISTS SWIG_C_TEST_CASES)
		create_node_test(${_NAME} FALSE _DEPENDENCY)
		list(APPEND _TARGET_DEPENDENCIES ${_DEPENDENCY})
	endforeach()
 
	message("###### check-javascript-node-testsuite: dependencies: ${_TARGET_DEPENDENCIES}")
	add_custom_target(check-javascript-node-testsuite
		DEPENDS ${_TARGET_DEPENDENCIES}
	)

endif()
