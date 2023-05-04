defmodule CrowPlugins.BEAM.ReductionsTest do
  use ExUnit.Case, async: true
  use CrowPlugins.BaseTest

  alias CrowPlugins.BEAM.Reductions

  describe "values/1" do
    test "total value is positive" do
      ['total.value ' ++ value] = Reductions.values([])
      assert String.to_integer(to_string(value)) > 0
    end
  end
end
