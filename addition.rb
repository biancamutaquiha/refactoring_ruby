class Addition < Operation
    def result
      @left_operation.result + @right_operation.result
    end
  
    def to_s
      "(#{@left_operation.to_s} + #{@right_operation.to_s})"
    end
  end