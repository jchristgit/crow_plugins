defmodule CrowPlugins.BEAM.Memory do
  @moduledoc """
  Generates a graph displaying the memory allocated by the emulator using `:erlang.memory/0`.
  """

  # http://erlang.org/doc/man/erlang.html#memory-0

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name do
    'beam_memory'
  end

  @doc false
  @impl true
  def config do
    [
      'graph_args --base 1000 -l 0',
      'graph_category beam',
      'total.label total memory',
      'total.info The total amount of memory currently allocated',
      'processes.label memory allocated for processes',
      'processes.info The total amount of memory currently allocated for Erlang processes',
      'processes_used.label memory used for processes',
      'processes_used.info The total amount of memory currently used for Erlang processes',
      'system.label memory allocated for the emulator itself',
      'system.info The total amount of memory currently allocated for the emulator that is not directly related to any Erlang process',
      'atom.label memory allocated for atoms',
      'atom.info The total amount of memory currently allocated for atoms',
      'atom_used.label memory currently used for atoms',
      'atom_used.info The total amount of memory currently used for atoms',
      'binary.label memory currently allocated for binaries',
      'binary.info The total amount of memory currently allocated for binaries',
      'code.label memory currently allocated for code',
      'code.info The total amount of memory currently allocated for Erlang code',
      'ets.label memory currently allocated for ETS tables',
      'ets.info The total amount of memory currently allocated for ETS tables'
    ]
  end

  @doc false
  @impl true
  def values do
    Enum.map(:erlang.memory(), fn {type, size} -> '#{type}.value #{size}' end)
  end
end
