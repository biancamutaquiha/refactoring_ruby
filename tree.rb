require_relative 'operation'
require_relative 'value'

class Node
    def initialize(operator, value, left, right)
      @operator = operator
      @value = value
      @left = left
      @right = right
    end
  
    def result
      case @operator
      when "x"
        @left.result * @right.result
      when "÷"
        @left.result / @right.result
      when "+"
        @left.result + @right.result
      when "-"
        @left.result - @right.result
      else
        Value.new(@value.to_f).result
      end
    end
  
    def to_s
      case @operator
      when "x"
        "(#{@left.to_s} x #{@right.to_s})"
      when "÷"
        "(#{@left.to_s} ÷ #{@right.to_s})"
      when "+"
        "(#{@left.to_s} + #{@right.to_s})"
      when "-"
        "(#{@left.to_s} - #{@right.to_s})"
      else
        Value.new(@value).to_s
      end
    end
  end
  
  tree = Node.new(
    "÷",
    nil,
    Node.new(
      "+",
      nil,
      Node.new("", 7, nil, nil),
      Node.new(
        "x",
        nil,
        Node.new("-", nil,
          Node.new("", 3, nil, nil),
          Node.new("", 2, nil, nil)
        ),
        Node.new("", 5, nil, nil)
      )
    ),
    Node.new("", 6, nil, nil)
  );

  tree_2 = Node.new("", 2, nil, nil)
  
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

  all_operations(tree)
  value_operation(tree_2)