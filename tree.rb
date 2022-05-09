require_relative 'operation'
require_relative 'value'
require_relative 'substraction'
require_relative 'addition'
require_relative 'division'
require_relative 'multiplication'

class Node
    def initialize(operations)
      @operations = operations
    end
  
    def result
      @operations.result
    rescue StandardError => e
      e.message
    end
  
    def to_s
      @operations.to_s
    end
  end
  
  def assert_equal(expected, actual)
    if expected != actual
      puts "Expected: #{expected.inspect}, got: #{actual.inspect}"
      exit 1
    end
  end

  def all_operations
    tree = Node.new(Division.new(
                      Addition.new(
                        Value.new(7),
                        Multiplication.new(
                          Substraction.new(Value.new(3), Value.new(2)),
                      Value.new(5)  
                                           )
                                    ),
                    Value.new(6)
                                  )
                    ) 

    assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", tree.to_s
    assert_equal 2, tree.result
  end

  def value_operation
    tree = Node.new(Value.new(2))

    assert_equal "2", tree.to_s
    assert_equal 2, tree.result
  end

  def substraction_operation
    tree = Node.new(Substraction.new(
                                    Value.new(3),
                                    Value.new(2)
                                    )
                    )

    assert_equal "(3 - 2)", tree.to_s
    assert_equal 1, tree.result
  end

  def addition_substraction_operations
    tree = Node.new(Addition.new(Value.new(3),
                                 Substraction.new(
                                    Value.new(3),
                                    Value.new(2)
                                    )
                                )    
                    )

    assert_equal "(3 + (3 - 2))", tree.to_s
    assert_equal 4, tree.result
  end

  def multiplication_division_operations
    tree = Node.new(Multiplication.new(Value.new(3),
                                 Division.new(
                                    Value.new(3),
                                    Value.new(2)
                                    )
                                )    
                    )

    assert_equal "(3 x (3 ÷ 2))", tree.to_s
    assert_equal 3, tree.result
  end

  def division_by_zero_operation
    tree = Node.new(Multiplication.new(Value.new(3),
                                 Division.new(
                                    Value.new(3),
                                    Value.new(0)
                                    )
                                )    
                    )

    assert_equal "(3 x (3 ÷ 0))", tree.to_s
    assert_equal "Try another Node Opeartions. Error: divided by 0", tree.result
  end


  value_operation
  substraction_operation
  addition_substraction_operations
  multiplication_division_operations
  division_by_zero_operation
  all_operations
