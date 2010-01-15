module Job
  def self.new(*args)
    Struct.new(*args)
  end
end
