require('fileutils')
require('testsuite')
require('swig')
require('open3')

# TODO variables should come from the CMake cache later
NODEJS='node'
NODEGYP='node-gyp'
BUILD_DIR=File.join(PROJECT_BUILD_DIR, "javascript", "test-suite")
SOURCE_DIR=File.dirname(__FILE__)
JS_TESTSUITE_DIR = File.join(TEST_SUITE_DIR, 'javascript')

# Note: nodejs can only handle cpp
[Swig::CPP_TESTS].each do |tests|

	tests.each do |name, test|

		# Skip broken tests
		next if test.is_broken?

		test_dir = File.join(BUILD_DIR, test.category, test.name)
		wrapper = test.is_c? ? "#{test.name}_wrap.c" : "#{test.name}_wrap.cxx"
		runner_name = test.name + "_runme.js"

		test_run_dir = File.join(BUILD_DIR, test.category)
		runner_source = File.join(JS_TESTSUITE_DIR, runner_name)
		runner = File.join(test_run_dir, runner_name)
		has_runner = File.exist? runner_source

		target_name = "test:javascript:node:#{test.name}"

		task "#{target_name}:setup" do

			binding_gyp = File.join(test_dir, 'binding.gyp')
			index_js = File.join(test_dir, 'index.js')

			# skip this if the generated files already exist
			# TODO: this should be done smarter, more rake-ishy
			if (File.exist?(binding_gyp) && File.exist?(index_js) && (!has_runner || File.exist?(runner)))
				next
			end

			if has_runner
				puts "Running test-case '#{test.name}' for javascript (node)"
			else
				puts "Compiling test-case '#{test.name}' for javascript (node) (test not implemented)"
			end

			# TODO: from the docu it seems that Ruby's default API is not verbose
			# Does Rake make this verbose by default???

			rm_rf test_dir, :verbose=>false if Dir.exist? test_dir

			mkdir_p test_dir, :verbose=>false # unless Dir.exist? test_dir

			template binding_gyp do
				source File.join(SOURCE_DIR, 'node-template', 'binding.gyp.erb')
				values 	:testcase => test.name,
						:wrapper => wrapper,
						:gyp_cflags => ''
			end

			template index_js do
				source File.join(SOURCE_DIR, 'node-template', 'index.js.erb')
				values 	:testcase => test.name
			end

			if has_runner
				cp runner_source, runner, :verbose=>false
			end
		end

		task "#{target_name}:build" => "#{target_name}:setup" do

			# skip this step if it already exists
			# TODO should be done smarter - more rake-ishy
			if (File.exist?(File.join(test_dir, "build", "Release", "#{test.name}.node")))
				next
			end

			swig File.join(TEST_SUITE_DIR, test.name + ".i") do
				cpp !test.is_c?
				options ["-javascript", "-node"]
				output File.join(test_dir, wrapper) 
			end

			Dir.chdir(test_dir) do
				cmd = "#{NODEGYP} configure build"
				Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
				  exit_status = wait_thr.value
				  unless exit_status.success?
				    STDOUT.puts "BUILD FAILED: #{test.name}"
				  end
				end
			end
		end

		task "#{target_name}:run" => "#{target_name}:build" do

			if has_runner
				Dir.chdir(test_run_dir) do
					Open3.popen3("#{NODEJS} #{runner_name}") do |stdin, stdout, stderr, wait_thr|
					  exit_status = wait_thr.value
					  STDOUT.puts "Finished #{test.name}: " + (exit_status.success? ? "OK" : "FAILED")
					end
				end
			end

		end


		desc "Runs test case '#{test.name}' (#{test.category}) using nodejs."
		task "#{target_name}" => "#{target_name}:run"

		desc "Runs all nodejs test-cases."
		task "test:javascript:node" => "#{target_name}"
	
	end

end

desc "Runs all javascript test-cases."
task "test:javascript" => "test:javascript:node"

desc "Runs the whole test-suite."
task "test" => "test:javascript"
