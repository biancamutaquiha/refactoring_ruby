require_relative 'operation'
require_relative 'value'
require_relative 'substraction'

class Node
    def initialize(operation)
      @operation = operation
    end
  
    def result
      @operation.result
    end
  
    def to_s
      @operation.to_s
    end
  end
  
  tree = Node.new(Value.new(2))

  tree_1 = Node.new(Value.new(2))

  tree_2 = Node.new(Substraction.new(
                                     Value.new(3),
                                     Value.new(2)
                                    )
                    ) 
  
  def assert_equal(expected, actual)
    if expected != actual
      puts "Expected: #{expected.inspect}, got: #{actual.inspect}"
      exit 1
    end
  end

  def all_operations(tree)
    assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", tree.to_s
    assert_equal 2, tree.result
  end

  def value_operation(tree)
    assert_equal "2", tree.to_s
    assert_equal 2, tree.result
  end

  def substraction_operation(tree)
    assert_equal "(3 - 2)", tree.to_s
    assert_equal 1, tree.result
  end

  value_operation(tree_1)
  substraction_operation(tree_2)
  all_operations(tree)
