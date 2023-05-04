ExUnit.start()

defmodule CrowPlugins.BaseTest do
  defmacro __using__(opts) do
    quote location: :keep do
      @split_test_name Module.split(__MODULE__)
      @final_segment List.last(@split_test_name)
      @final_segment_without_test String.replace_suffix(@final_segment, "Test", "")
      @plugin_name_list List.replace_at(@split_test_name, -1, @final_segment_without_test)
      @plugin_name Keyword.get(unquote(opts), :plugin) || Module.safe_concat(@plugin_name_list)
      @plugin_options Keyword.get(unquote(opts), :options, [])

      doctest @plugin_name

      test "name/1 returns a charlist" do
        name = @plugin_name.name(@plugin_options)
        assert is_list(name)
      end

      test "config/1 returns a list of charlists" do
        config = @plugin_name.config(@plugin_options)
        assert is_list(config)
        assert Enum.all?(config, &is_list/1)
      end

      test "values/1 returns a list of charlists" do
        values = @plugin_name.values(@plugin_options)
        assert is_list(values)
        assert Enum.all?(values, &is_list/1)
      end
    end
  end
end
