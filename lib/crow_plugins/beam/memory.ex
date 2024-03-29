defmodule CrowPlugins.BEAM.Memory do
  @moduledoc """
  Generates a graph displaying the memory allocated by the emulator using `:erlang.memory/0`.
  """

  # http://erlang.org/doc/man/erlang.html#memory-0

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    'beam_memory'
  end

  @doc false
  @impl true
  def config(_options) do
    [
      'graph_args --base 1024',
      'graph_category beam',
      'graph_title BEAM memory usage',
      'total.label total memory',
      'total.info The total amount of memory currently allocated',
      'total.min 0',
      'processes.label memory allocated for processes',
      'processes.info The total amount of memory currently allocated for Erlang processes',
      'processes.min 0',
      'processes_used.label memory used for processes',
      'processes_used.info The total amount of memory currently used for Erlang processes',
      'processes_used.min 0',
      'system.label memory allocated for the emulator itself',
      'system.info The total amount of memory currently allocated for the emulator that is not directly related to any Erlang process',
      'system.min 0',
      'atom.label memory allocated for atoms',
      'atom.info The total amount of memory currently allocated for atoms',
      'atom.min 0',
      'atom_used.label memory used for atoms',
      'atom_used.info The total amount of memory currently used for atoms',
      'atom_used.min 0',
      'binary.label memory allocated for binaries',
      'binary.info The total amount of memory currently allocated for binaries',
      'binary.min 0',
      'code.label memory allocated for code',
      'code.info The total amount of memory currently allocated for Erlang code',
      'code.min 0',
      'ets.label memory allocated for ETS tables',
      'ets.info The total amount of memory currently allocated for ETS tables',
      'ets.min 0'
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    Enum.map(:erlang.memory(), fn {type, size} -> '#{type}.value #{size}' end)
  end
end
