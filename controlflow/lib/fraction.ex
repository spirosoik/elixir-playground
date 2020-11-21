defmodule Fraction do

  defstruct a: nil, b: nil

  def new(a, b) do
    %Fraction{a: a, b: b}
  end

  def value(fraction) do
    fraction.a / fraction.b
  end
end
