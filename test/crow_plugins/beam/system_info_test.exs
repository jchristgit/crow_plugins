defmodule CrowPlugins.BEAM.SystemInfoTest do
  use ExUnit.Case, async: true

  alias CrowPlugins.BEAM.SystemInfo

  describe "config/0" do
    test "returns a list of charlists" do
      config = SystemInfo.config()
      assert is_list(config)
      assert Enum.all?(config, &is_list/1)
    end
  end

  describe "values/0" do
    test "returns a list of charlists" do
      values = SystemInfo.values()
      assert is_list(values)
      assert Enum.all?(values, &is_list/1)
    end
  end
end
