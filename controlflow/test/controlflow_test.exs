defmodule ControlflowTest do
  use ExUnit.Case
  doctest Controlflow

  test "greets the world" do
    assert Controlflow.hello() == :world
  end
end
