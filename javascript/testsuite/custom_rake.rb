# Rake can be run programmatically in a custom way:

# Another idea is to prepare a Rake tree using CMake
# which can be run from the CLI or as a custom CMake target.

require 'rake'

# Save the CLI arguments as Rake will reset it(?!)
@argv = ARGV.clone 
Rake.application.init

# This might be a place to store key-value pairs given on the command line
@definitions = {}

# one would define some tasks

desc "Does the blupp"
task "blupp" do
	puts "blupp"
end

desc "Does some bla bla"
task "bla" => :blupp do
	puts "bla bla"
end


# The custom application:

for i in 0..@argv.length
	a = @argv[i]

	if a == "--help" or a == "-T"
		Rake.application.tasks.each do |task|
			puts "   #{task.name}:  #{task.full_comment}"
		end
	elsif a && a.start_with?("-D")
		definition = a[2..-1]
		key, value = definition.split('=')
		@definitions[key] = value
	elsif a
		Rake.application[a].invoke
	end
end
