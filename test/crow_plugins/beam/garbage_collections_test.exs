defmodule CrowPlugins.BEAM.GarbageCollectionsTest do
  use ExUnit.Case, async: true

  alias CrowPlugins.BEAM.GarbageCollections

  describe "config/0" do
    test "returns a list of charlists" do
      config = GarbageCollections.config()
      assert is_list(config)
      assert Enum.all?(config, &is_list/1)
    end
  end

  describe "values/0" do
    test "returns a list of charlists" do
      values = GarbageCollections.values()
      assert is_list(values)
      assert Enum.all?(values, &is_list/1)
    end

    test "total value is positive" do
      ['total.value ' ++ value] = GarbageCollections.values()
      assert String.to_integer(to_string(value)) > 0
    end
  end
end
