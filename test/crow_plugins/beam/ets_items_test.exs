defmodule CrowPlugins.BEAM.ETSItemsTest do
  alias CrowPlugins.BEAM.ETS
  use ExUnit.Case, async: true

  @option_tables [:logger]

  use CrowPlugins.BaseTest, plugin: ETS, options: [mode: :items, tables: @option_tables]

  describe "name/1" do
    test "works with custom name" do
      assert ETS.name(mode: :items) != ETS.name(name: "mike", mode: :items)
    end
  end

  describe "config/1" do
    test "works with custom name" do
      assert ETS.config(mode: :items, tables: []) !=
               ETS.config(mode: :items, name: "mike", tables: [])
    end

    test "works with custom title" do
      assert ETS.config(mode: :items, tables: []) !=
               ETS.config(mode: :items, title: "mike", tables: [])
    end
  end
end
