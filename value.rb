class Value < Operation
  def initialize(left_operation, right_operation = nil)
    super
  end

  def result
    @left_operation
  end

  def to_s
    @left_operation.to_s
  end
end