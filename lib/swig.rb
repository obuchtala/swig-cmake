private
# TODO this should come from CMake
SWIG_EXECUTABLE=File.join(PROJECT_BUILD_DIR, 'Dist', 'swig.exe')

class SwigCommandData

  def initialize(ifile)
    @_interface = ifile
    @_output = nil
    @_options = []
    @_is_cpp = false
    @_working_dir = nil
  end

  def source(ifile)
    @_interface = ifile
  end

  def output(outfile)
    @_output = outfile
  end

  def options(options)
    @_options += options
  end

  def cpp(is_cpp)
    @_is_cpp = is_cpp
  end

  def working_dir(working_dir)
    @_working_dir = working_dir
  end

  def run()
    cmd = [SWIG_EXECUTABLE];
    cmd += ['-c++'] if @_is_cpp
    cmd += @_options
    cmd += ['-o', @_output, @_interface]
    cmd = cmd.join(' ')

    if @_working_dir
      Dir.chdir(@_working_dir) do
        system(cmd)
      end
    else
      system(cmd)
    end

  end

end

public

def swig(ifile, &spec)
  command = SwigCommandData.new(ifile)
  command.instance_eval(&spec)

  command.run()
end
