defmodule CrowPlugins.BEAM.ReductionsTest do
  use ExUnit.Case, async: true

  alias CrowPlugins.BEAM.Reductions

  describe "name/0" do
    test "returns a charlist" do
      name = Reductions.name()
      assert is_list(name)
    end
  end

  describe "config/0" do
    test "returns a list of charlists" do
      config = Reductions.config()
      assert is_list(config)
      assert Enum.all?(config, &is_list/1)
    end
  end

  describe "values/0" do
    test "returns a list of charlists" do
      values = Reductions.values()
      assert is_list(values)
      assert Enum.all?(values, &is_list/1)
    end

    test "total value is positive" do
      ['total.value ' ++ value] = Reductions.values()
      assert String.to_integer(to_string(value)) > 0
    end
  end
end
