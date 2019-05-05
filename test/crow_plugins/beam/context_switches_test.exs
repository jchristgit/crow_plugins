defmodule CrowPlugins.BEAM.ContextSwitchesTest do
  use ExUnit.Case, async: true

  alias CrowPlugins.BEAM.ContextSwitches

  describe "config/0" do
    test "returns a list of charlists" do
      config = ContextSwitches.config()
      assert is_list(config)
      assert Enum.all?(config, &is_list/1)
    end
  end

  describe "values/0" do
    test "returns a list of charlists" do
      values = ContextSwitches.values()
      assert is_list(values)
      assert Enum.all?(values, &is_list/1)
    end

    test "total value is positive" do
      ['total.value ' ++ value] = ContextSwitches.values()
      assert String.to_integer(to_string(value)) > 0
    end
  end
end
