defmodule CrowPluginsTest do
  use ExUnit.Case
  doctest CrowPlugins

  test "greets the world" do
    assert CrowPlugins.hello() == :world
  end
end
