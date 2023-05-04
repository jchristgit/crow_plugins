defmodule CrowPlugins.BEAM.GarbageCollectionsTest do
  use ExUnit.Case, async: true
  use CrowPlugins.BaseTest

  alias CrowPlugins.BEAM.GarbageCollections

  describe "values/1" do
    test "total value is positive" do
      ['total.value ' ++ value] = GarbageCollections.values([])
      assert String.to_integer(to_string(value)) > 0
    end
  end
end
