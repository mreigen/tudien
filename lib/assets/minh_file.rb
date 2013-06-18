class MinhFile
  attr_accessor :name, :file
  def initialize(name, mode)
    @name = name
    @file = File.new(name, mode)
  end

  def clear!
    @file = File.open(@name, "w")
    @file.write("")
  end

  def append(line); @file.puts line; end
  def gets; @file.gets; end
  def close; @file.close; end
end