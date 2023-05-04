defmodule CrowPlugins.BEAM.SystemInfoTest do
  use ExUnit.Case, async: true
  use CrowPlugins.BaseTest

  alias CrowPlugins.BEAM.SystemInfo

  describe "config/1" do
    test "works with logarithmic option" do
      config = SystemInfo.config(scale: :logarithmic)
      assert is_list(config)
      assert Enum.all?(config, &is_list/1)
    end
  end

  describe "values/1" do
    test "works with logarithmic option" do
      values = SystemInfo.values(scale: :logarithmic)
      assert is_list(values)
      assert Enum.all?(values, &is_list/1)
    end
  end
end
