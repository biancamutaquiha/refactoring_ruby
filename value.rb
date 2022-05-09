class Value < Operation
  def initialize(value)
    @value = value
  end

  def result
    @value
  end

  def to_s
    @value.to_s
  end
end