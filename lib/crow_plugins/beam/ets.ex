defmodule CrowPlugins.BEAM.ETS do
  @moduledoc """
  Display the memory size or item count of the given ETS tables.

  Graph values will be named according to the table title as returned from
  `:ets.info(tab, :name)`. This allows unnamed tables to be monitored as well.

  ## Configuration

  This following configuration options are required:

  - `{:tables, nonempty_list(:ets.table())}`: A list of tables to instrument.
  Tables will be instrumented in the order they appear here. This also affects
  the order of the tables in the output.

  - `{:mode, :memory | :items}`: Whether to monitor the memory usage or amount
  of items in the given tables. Note that the name is changed automatically,
  and you can re-use the name if you are monitoring the same table#s memory and
  items separately.

  The following configuration options are optional:

  - `{:name, nonempty_charlist()}`: A custom name to identify this module with,
  appended after the base name.

  - `{:title, nonempty_charlist()}`: A custom title to use for graphing the
  module, appended after the base title. If the `:name` option is provided but
  this setting isn't, the `name` will be used.

  ## Example

  To monitor the memory usage of the tables exposed by
  [nostrum](https://github.com/Kraigie/nostrum)'s ETS caches, one could use:

  ```elixir
  config :crow,
    plugins: [
      {CrowPlugins.BEAM.ETS,
       name: 'nostrum_caches',
       mode: :memory,
       tables: [
         :nostrum_guilds,
         :nostrum_members,
         :nostrum_users
       ]}
    ]
  ```
  """

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(options) do
    mode = Keyword.fetch!(options, :mode)

    case Keyword.get(options, :name) do
      nil -> 'beam_ets_#{mode}'
      name -> 'beam_ets_#{mode}_#{name}'
    end
  end

  @doc false
  @impl true
  def config(options) do
    mode = Keyword.fetch!(options, :mode)

    [
      'graph_title ets table #{mode}' ++ custom_title(options),
      'graph_category beam',
      'graph_vlabel #{graph_vlabel(mode)}'
    ] ++ table_config(options)
  end

  @doc false
  @impl true
  def values(options) do
    word_size = :erlang.system_info(:wordsize)

    case Keyword.fetch!(options, :mode) do
      :memory ->
        map_tables(options, :memory, fn {internal_name, memory} ->
          ['#{internal_name}.value #{memory * word_size}']
        end)

      :items ->
        map_tables(options, :size, fn {internal_name, items} ->
          ['#{internal_name}.value #{items}']
        end)
    end
  end

  defp custom_title(options) do
    case Keyword.get(options, :title) do
      nil ->
        case Keyword.get(options, :name) do
          nil -> ''
          name -> ' (#{name})'
        end

      title ->
        ' (#{title})'
    end
  end

  defp table_config(options) do
    base =
      map_tables(options, :name, fn {internal_name, name} ->
        [
          '#{internal_name}.draw AREASTACK',
          '#{internal_name}.min 0',
          '#{internal_name}.label #{name}'
        ]
      end)

    case Keyword.fetch!(options, :mode) do
      :memory -> ['graph_args --base 1024' | base]
      _ -> base
    end
  end

  defp map_tables(options, key, mapper) do
    options
    |> Keyword.fetch!(:tables)
    |> Stream.map(&:ets.info(&1))
    |> Stream.map(&{internal_name(&1[:name]), &1[key]})
    |> Enum.flat_map(&mapper.(&1))
  end

  defp internal_name(name) do
    name
    |> Atom.to_string()
    |> :binary.replace(".", "_")
    |> :string.lowercase()
  end

  defp graph_vlabel(:memory), do: "memory usage in bytes"
  defp graph_vlabel(:items), do: "items in table"
end
