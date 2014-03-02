require 'erb'

private
class ValuesBinding
  def initialize(values)
    @values = values;
  end

  def get_binding
    return binding
  end

  def method_missing(name)
    if (name == "values")
      return @values
    end

    # TODO: I had the problem, that a value was not looked up when it was provided as
    #    'key' => value
    # instead of
    #    :key => value
    # Find out why that should be....

    return @values[name];
  end

end

private
class TemplateData

  def initialize(name)
    @_path = name
    @_source = nil
    @_values = {}
    @_mode = 0644
  end

  def source(path)
    @_source = path
  end

  def path(path)
    @_path = path
  end

  def values(vals)
    @_values = vals
  end

  def mode(mode)
    @_mode = mode
  end

  def run()
    template = File.read(@_source)
    renderer = ERB.new(template)

    # puts "Creating #{@_path} from #{@_source} [ #{@_values.inspect} ]"
    _values = ValuesBinding.new(@_values);
    content = renderer.result(_values.get_binding)

    File.open(@_path, 'w') {|f| f.write(content) }
    File.chmod(@_mode, @_path)
  end

end

# Template Task
# -----
#
# Creates a task with the given name that creates a file
# using a ERB template file.
# The task is triggered whenever the source file has changed.
#
# Usage:
#
# ```
# template "out.txt" do
#   source "templates/mytemplate.erb"
#   mode 0644
# end
# ```

public

# extend FileUtils with FileUtils.template
module Rake
  module FileUtilsExt

    def template(name, &spec)
      command = TemplateData.new(name)
      command.instance_eval(&spec)
      command.run()
    end
  end
end
