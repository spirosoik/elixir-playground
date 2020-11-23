defmodule TodoDatabasePoolingTest do
  use ExUnit.Case
  doctest TodoDatabasePooling

  test "greets the world" do
    assert TodoDatabasePooling.hello() == :world
  end
end
