defmodule CrowPlugins.BEAM.ETSItemsTest do
  alias CrowPlugins.Beam.ETS
  use ExUnit.Case, async: true

  @option_tables [:logger]

  use CrowPlugins.BaseTest, plugin: ETS, options: [mode: :items, tables: @option_tables]

  describe "name/1" do
    test "works with custom name" do
      assert ETSMemory.name([]) != ETSMemory.name(name: "mike")
    end
  end

  describe "config/1" do
    test "works with custom name" do
      assert ETSMemory.config(tables: []) != ETSMemory.config(name: "mike", tables: [])
    end

    test "works with custom title" do
      assert ETSMemory.config(tables: []) != ETSMemory.config(title: "mike", tables: [])
    end
  end
end
