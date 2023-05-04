defmodule CrowPlugins.BEAM.ContextSwitchesTest do
  alias CrowPlugins.BEAM.ContextSwitches
  use ExUnit.Case, async: true
  use CrowPlugins.BaseTest

  describe "values/1" do
    test "total value is positive" do
      ['total.value ' ++ value] = ContextSwitches.values([])
      assert String.to_integer(to_string(value)) > 0
    end
  end
end
