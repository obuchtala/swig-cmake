# Exposes a global reference `TESTS`

public

module Swig

	C_TEST_NAMES = [
		"arrays",
		"bom_utf8",
		"char_constant",
		"const_const",
		"constant_expr",
		"empty",
		"enums",
		"enum_forward",
		"enum_macro",
		"extern_declaration",
		"funcptr",
		"function_typedef",
		"immutable_values",
		"inctest",
		"integers",
		"keyword_rename",
		"lextype",
		"li_carrays",
		"li_cdata",
		"li_cmalloc",
		"li_constraints",
		"li_cpointer",
		"li_math",
		"long_long",
		"memberin_extend_c",
		"name",
		"nested",
		"nested_structs",
		"newobject2",
		"overload_extend",
		"overload_extendc",
		"preproc",
		"preproc_constants_c",
		"preproc_defined",
		"preproc_include",
		"preproc_line_file",
		"ret_by_value",
		"simple_array",
		"sizeof_pointer",
		"sneaky1",
		"struct_rename",
		"struct_initialization",
		"typedef_struct",
		"typemap_subst",
		"union_parameter",
		"unions"
	]

	CPP_TEST_NAMES = [
		"abstract_access",
		"abstract_inherit",
		"abstract_inherit_ok",
		"abstract_signature",
		"abstract_typedef",
		"abstract_typedef2",
		"abstract_virtual",
		"access_change",
		"add_link",
		"aggregate",
		"allowexcept",
		"allprotected",
		"allprotected_not",
		"anonymous_bitfield",
		"apply_signed_char",
		"apply_strings",
		"argout",
		"array_member",
		"array_typedef_memberin",
		"arrayref",
		"arrays_dimensionless",
		"arrays_global",
		"arrays_global_twodim",
		"arrays_scope",
		"autodoc",
		"bloody_hell",
		"bools",
		"catches",
		"cast_operator",
		"casts",
		"char_binary",
		"char_strings",
		"class_forward",
		"class_ignore",
		"class_scope_weird",
		"compactdefaultargs",
		"const_const_2",
		"constant_pointers",
		"constover",
		"constructor_copy",
		"constructor_exception",
		"constructor_explicit",
		"constructor_ignore",
		"constructor_rename",
		"constructor_value",
		"contract",
		"conversion",
		"conversion_namespace",
		"conversion_ns_template",
		"cplusplus_throw",
		"cpp_basic",
		"cpp_enum",
		"cpp_namespace",
		"cpp_nodefault",
		"cpp_static",
		"cpp_typedef",
		"curiously_recurring_template_pattern",
		"default_args",
		"default_arg_values",
		"default_constructor",
		"defvalue_constructor",
		"derived_byvalue",
		"derived_nested",
		"destructor_reprotected",
		"director_abstract",
		"director_alternating",
		"director_basic",
		"director_binary_string",
		"director_classes",
		"director_classic",
		"director_constructor",
		"director_default",
		"director_detect",
		"director_enum",
		"director_exception",
		"director_extend",
		"director_finalizer",
		"director_frob",
		"director_ignore",
		"director_keywords",
		"director_namespace_clash",
		"director_nspace",
		"director_nspace_director_name_collision",
		"director_nested",
		"director_overload",
		"director_overload2",
		"director_primitives",
		"director_protected",
		"director_protected_overloaded",
		"director_redefined",
		"director_smartptr",
		"director_thread",
		"director_unroll",
		"director_using",
		"director_wombat",
		"disown",
		"dynamic_cast",
		"empty",
		"enum_rename",
		"enum_scope_template",
		"enum_template",
		"enum_thorough",
		"enum_var",
		"evil_diamond",
		"evil_diamond_ns",
		"evil_diamond_prop",
		"exception_order",
		"extend",
		"extend_constructor_destructor",
		"extend_default",
		"extend_placement",
		"extend_special_variables",
		"extend_template",
		"extend_template_ns",
		"extend_typedef_class",
		"extern_c",
		"extern_namespace",
		"extern_throws",
		"expressions",
		"features",
		"fragments",
		"friends",
		"funcptr_cpp",
		"fvirtual",
		"global_namespace",
		"global_ns_arg",
		"global_scope_types",
		"global_vars",
		"grouping",
		"ignore_parameter",
		"import_nomodule",
		"inherit",
		"inherit_missing",
		"inherit_same_name",
		"inherit_target_language",
		"inherit_void_arg",
		"inline_initializer",
		"insert_directive",
		"keyword_rename",
		"kind",
		"langobj",
		"li_attribute",
		"li_attribute_template",
		"li_boost_shared_ptr",
		"li_boost_shared_ptr_bits",
		"li_boost_shared_ptr_template",
		"li_carrays",
		"li_cdata",
		"li_cpointer",
		"li_stdint",
		"li_typemaps",
		"li_typemaps_apply",
		"li_windows",
		"long_long_apply",
		"memberin_extend",
		"member_funcptr_galore",
		"member_pointer",
		"member_template",
		"minherit",
		"minherit2",
		"mixed_types",
		"multiple_inheritance",
		"name_cxx",
		"name_warnings",
		"namespace_class",
		"namespace_enum",
		"namespace_extend",
		"namespace_forward_declaration",
		"namespace_nested",
		"namespace_spaces",
		"namespace_template",
		"namespace_typedef_class",
		"namespace_typemap",
		"namespace_union",
		"namespace_virtual_method",
		"nspace",
		"nspace_extend",
		"naturalvar",
		"nested_class",
		"nested_comment",
		"nested_workaround",
		"newobject1",
		"null_pointer",
		"operator_overload",
		"operator_overload_break",
		"operator_pointer_ref",
		"operbool",
		"ordering",
		"overload_copy",
		"overload_method",
		"overload_extend",
		"overload_rename",
		"overload_return_type",
		"overload_simple",
		"overload_subtype",
		"overload_template",
		"overload_template_fast",
		"pointer_reference",
		"preproc_constants",
		"primitive_ref",
		"private_assign",
		"protected_rename",
		"pure_virtual",
		"redefined",
		"redefined_not",
		"refcount",
		"reference_global_vars",
		"register_par",
		"rename1",
		"rename2",
		"rename3",
		"rename4",
		"rename_scope",
		"rename_simple",
		"rename_strip_encoder",
		"rename_pcre_encoder",
		"rename_pcre_enum",
		"restrict_cplusplus",
		"return_const_value",
		"return_value_scope",
		"rname",
		"samename",
		"sizet",
		"smart_pointer_const",
		"smart_pointer_const2",
		"smart_pointer_const_overload",
		"smart_pointer_extend",
		"smart_pointer_member",
		"smart_pointer_multi",
		"smart_pointer_multi_typedef",
		"smart_pointer_namespace",
		"smart_pointer_namespace2",
		"smart_pointer_not",
		"smart_pointer_overload",
		"smart_pointer_protected",
		"smart_pointer_rename",
		"smart_pointer_simple",
		"smart_pointer_static",
		"smart_pointer_template_const_overload",
		"smart_pointer_templatemethods",
		"smart_pointer_templatevariables",
		"smart_pointer_typedef",
		"special_variables",
		"special_variable_macros",
		"static_array_member",
		"static_const_member",
		"static_const_member_2",
		"struct_initialization_cpp",
		"struct_value",
		"symbol_clash",
		"template_arg_replace",
		"template_arg_scope",
		"template_arg_typename",
		"template_array_numeric",
		"template_basic",
		"template_base_template",
		"template_classes",
		"template_const_ref",
		"template_construct",
		"template_default",
		"template_default2",
		"template_default_arg",
		"template_default_arg_virtual_destructor",
		"template_default_class_parms",
		"template_default_class_parms_typedef",
		"template_default_inherit",
		"template_default_qualify",
		"template_default_vw",
		"template_enum",
		"template_enum_ns_inherit",
		"template_enum_typedef",
		"template_explicit",
		"template_extend1",
		"template_extend2",
		"template_extend_overload",
		"template_extend_overload_2",
		"template_forward",
		"template_inherit",
		"template_inherit_abstract",
		"template_int_const",
		"template_methods",
		"template_namespace_forward_declaration",
		"template_using_directive_and_declaration_forward",
		"template_nested",
		"template_nested_typemaps",
		"template_ns",
		"template_ns2",
		"template_ns3",
		"template_ns4",
		"template_ns_enum",
		"template_ns_enum2",
		"template_ns_inherit",
		"template_ns_scope",
		"template_partial_arg",
		"template_partial_specialization",
		"template_partial_specialization_typedef",
		"template_qualifier",
		"template_qualifier",
		"template_ref_type",
		"template_rename",
		"template_retvalue",
		"template_specialization",
		"template_specialization_defarg",
		"template_specialization_enum",
		"template_static",
		"template_tbase_template",
		"template_template_parameters",
		"template_typedef",
		"template_typedef_class_template",
		"template_typedef_cplx",
		"template_typedef_cplx2",
		"template_typedef_cplx3",
		"template_typedef_cplx4",
		"template_typedef_cplx5",
		"template_typedef_funcptr",
		"template_typedef_inherit",
		"template_typedef_ns",
		"template_typedef_ptr",
		"template_typedef_rec",
		"template_typemaps",
		"template_typemaps_typedef",
		"template_typemaps_typedef2",
		"template_using",
		"template_virtual",
		"template_whitespace",
		"threads",
		"threads_exception",
		"throw_exception",
		"typedef_array_member",
		"typedef_class",
		"typedef_funcptr",
		"typedef_inherit",
		"typedef_mptr",
		"typedef_reference",
		"typedef_scope",
		"typedef_sizet",
		"typedef_struct",
		"typemap_arrays",
		"typemap_array_qualifiers",
		"typemap_delete",
		"typemap_directorout",
		"typemap_global_scope",
		"typemap_manyargs",
		"typemap_namespace",
		"typemap_ns_using",
		"typemap_numinputs",
		"typemap_template",
		"typemap_template_parm_typedef",
		"typemap_out_optimal",
		"typemap_qualifier_strip",
		"typemap_variables",
		"typemap_various",
		"typename",
		"types_directive",
		"union_scope",
		"using1",
		"using2",
		"using_composition",
		"using_directive_and_declaration",
		"using_directive_and_declaration_forward",
		"using_extend",
		"using_inherit",
		"using_namespace",
		"using_namespace_loop",
		"using_pointers",
		"using_private",
		"using_protected",
		"valuewrapper",
		"valuewrapper_base",
		"valuewrapper_const",
		"valuewrapper_opaque",
		"varargs",
		"varargs_overload",
		"virtual_destructor",
		"virtual_poly",
		"virtual_vs_nonvirtual_base",
		"voidtest",
		"wallkw",
		"wrapmacro"
	]

	CPP_STD_TEST_CASES = [
		"director_string",
		"ignore_template_constructor",
		"li_std_combinations",
		"li_std_deque",
		"li_std_except",
		"li_std_except_as_class",
		"li_std_map",
		"li_std_pair",
		"li_std_pair_using",
		"li_std_string",
		"li_std_vector",
		"li_std_vector_enum",
		"li_std_vector_member_var",
		"naturalvar",
		"smart_pointer_inherit",
		"template_typedef_fnc",
		"template_type_namespace",
		"template_opaque"
	]

	MULTI_CPP_TEST_NAMES = [
		"clientdata_prop",
		"imports",
		"import_stl",
		"packageoption",
		"mod",
		"template_typedef_import",
		"multi_import"
	]

	BROKEN_C_TEST_NAMES = [
		"tag_no_clash_with_variable"
	]

	BROKEN_CPP_TEST_NAMES = [
		"constants",
		"cpp_broken",
		"exception_partial_info",
		"extend_variable",
		"li_std_vector_ptr",
		"li_boost_shared_ptr_template",
		"overload_complicated",
		"template_default_pointer",
		"template_expr"
	]

	BROKEN_MULTI_CPP_TEST_NAMES = [
	]

	class TestCase

		attr_reader :name

	  def initialize(name, is_cpp, is_multi, is_broken)
	    @name = name
	    @is_cpp = is_cpp
	    @is_multi = is_multi
	    @is_broken = is_broken
	  end

	  def is_cpp? ()
	  	return @is_cpp
	  end

	  def is_c? ()
	  	return !@is_cpp
	  end

	  def is_multi? ()
	  	return @is_multi
	  end

	  def is_broken? ()
	  	return @is_broken
	  end

	  def full_name()
	  	full_name = @name
	  	full_name += @is_cpp ? "_cpp" : "_c"
	  	full_name += "_multi" if @is_multi
	  	return full_name
	  end

	  def category()
	  	if @is_cpp
	  		return @is_multi ? "multi_cpp" : "cpp" 
	  	else
	  		return @is_multi ? "multi_cpp" : "c" 
	  	end
	  end

	end

	C_TESTS = {}
	C_TEST_NAMES.each do |name|
		C_TESTS[name] = TestCase.new(name, false, false, false)
	end

	CPP_TESTS = {}
	CPP_TEST_NAMES.each do |name|
		CPP_TESTS[name] = TestCase.new(name, true, false, false)
	end

	MULTI_CPP_TESTS = {}
	MULTI_CPP_TEST_NAMES.each do |name|
		MULTI_CPP_TESTS[name] = TestCase.new(name, true, true, false)
	end

	# BROKEN_C_TEST_NAMES.each do |name|
	# 	if TESTS.has_key? name
	# 		throw "Test already registered: #{name}, #{TESTS[name].inspect}"
	# 	end 
	# 	TESTS[name] = TestCase.new(name, false, false, true)
	# end

	# BROKEN_CPP_TEST_NAMES.each do |name|
	# 	if TESTS.has_key? name
	# 		throw "Test already registered: #{name}, #{TESTS[name].inspect}"
	# 	end 
	# 	TESTS[name] = TestCase.new(name, true, false, true)
	# end

	# BROKEN_MULTI_CPP_TEST_NAMES.each do |name|
	# 	if TESTS.has_key? name
	# 		throw "Test already registered: #{name}, #{TESTS[name].inspect}"
	# 	end 
	# 	TESTS[name] = TestCase.new(name, true, true, true)
	# end

end
