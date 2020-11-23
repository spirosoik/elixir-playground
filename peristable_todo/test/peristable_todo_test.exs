defmodule PeristableTodoTest do
  use ExUnit.Case
  doctest PeristableTodo

  test "greets the world" do
    assert PeristableTodo.hello() == :world
  end
end
