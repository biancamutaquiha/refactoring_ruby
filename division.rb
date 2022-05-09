class Division < Operation
  def result
    @left_operation.result / @right_operation.result
  rescue ZeroDivisionError => e
    raise e, "Try another Node Opeartions. Error: #{e.message}"
  end
  
  def to_s
    "(#{@left_operation.to_s} ÷ #{@right_operation.to_s})"
  end
end