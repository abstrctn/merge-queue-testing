class Adder
  def add(a, b)
    if !a.is_a?(Integer) || !b.is_a?(Integer)
      raise ArgumentError, "Arguments must be integers"
    end

    a + b
  end
end
