require 'bigdecimal'

class ComplexNumber
  attr_reader :real, :imaginary
  def initialize(a, b = 0)
    @real = a
    @imaginary = b
  end

  def +(other)
    a, b, c, d = get_operands(other)
    ComplexNumber.new(a+c, b+d)
  end

  def -(other)
    a, b, c, d = get_operands(other)
    ComplexNumber.new(a-c, b-d)
  end

  def *(other)
    a, b, c, d = get_operands(other)    
    ComplexNumber.new(a*c - b*d, b*c + a*d)
  end

  def /(other)
    a, b, c, d = get_operands(other)
    ComplexNumber.new(
      BigDecimal(a*c + b*d) / other.abs ** 2,
      BigDecimal(b*c - a*d) / other.abs ** 2
    )
  end

  def exp
    re = Math.exp(real) * Math.cos(imaginary)
    im = Math.exp(real) * Math.sin(imaginary)
    ComplexNumber.new(
      (re.round(10) - re) < 1e-12 ? re.round(10) : re,
      (im.round(10) - im) < 1e-12 ? im.round(10) : im
    )
  end

  def ==(other)
    a, b, c, d = get_operands(other)
    a == c && b == d
  end

  def abs = Math.sqrt(real**2 + imaginary**2)
  def conjugate = ComplexNumber.new(real, -imaginary)

  private
  def get_operands(other)
    return real, imaginary, other.real, other.imaginary
  end
end