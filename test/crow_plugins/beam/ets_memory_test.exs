defmodule CrowPlugins.BEAM.ETSTest do
  alias CrowPlugins.BEAM.ETS
  use ExUnit.Case, async: true

  @option_tables [:logger]

  use CrowPlugins.BaseTest, plugin: ETS, options: [mode: :memory, tables: @option_tables]

  describe "name/1" do
    test "works with custom name" do
      assert ETS.name(mode: :memory) != ETS.name(name: "mike", mode: :memory)
    end
  end

  describe "config/1" do
    test "works with custom name" do
      assert ETS.config(tables: [], mode: :memory) !=
               ETS.config(name: "mike", mode: :memory, tables: [])
    end

    test "works with custom title" do
      assert ETS.config(tables: [], mode: :memory) !=
               ETS.config(title: "mike", mode: :memory, tables: [])
    end
  end
end
