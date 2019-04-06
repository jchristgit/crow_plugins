defmodule CrowPlugins.BEAM.MemoryTest do
  use ExUnit.Case, async: true

  alias CrowPlugins.BEAM.Memory

  describe "config/0" do
    test "returns a list of charlists" do
      config = Memory.config()
      assert is_list(config)
      assert Enum.all?(config, &is_list/1)
    end
  end

  describe "values/0" do
    test "returns a list of charlists" do
      values = Memory.values()
      assert is_list(values)
      assert Enum.all?(values, &is_list/1)
    end
  end
end
