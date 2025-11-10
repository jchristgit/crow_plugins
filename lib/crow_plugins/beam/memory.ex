defmodule CrowPlugins.BEAM.Memory do
  @moduledoc """
  Generates a graph displaying the memory allocated by the emulator using `:erlang.memory/0`.
  """

  # http://erlang.org/doc/man/erlang.html#memory-0

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    ~c"beam_memory"
  end

  @doc false
  @impl true
  def config(_options) do
    [
      ~c"graph_args --base 1024",
      ~c"graph_category beam",
      ~c"graph_title BEAM memory usage",
      ~c"total.label total memory",
      ~c"total.info The total amount of memory currently allocated",
      ~c"total.min 0",
      ~c"processes.label memory allocated for processes",
      ~c"processes.info The total amount of memory currently allocated for Erlang processes",
      ~c"processes.min 0",
      ~c"processes_used.label memory used for processes",
      ~c"processes_used.info The total amount of memory currently used for Erlang processes",
      ~c"processes_used.min 0",
      ~c"system.label memory allocated for the emulator itself",
      ~c"system.info The total amount of memory currently allocated for the emulator that is not directly related to any Erlang process",
      ~c"system.min 0",
      ~c"atom.label memory allocated for atoms",
      ~c"atom.info The total amount of memory currently allocated for atoms",
      ~c"atom.min 0",
      ~c"atom_used.label memory used for atoms",
      ~c"atom_used.info The total amount of memory currently used for atoms",
      ~c"atom_used.min 0",
      ~c"binary.label memory allocated for binaries",
      ~c"binary.info The total amount of memory currently allocated for binaries",
      ~c"binary.min 0",
      ~c"code.label memory allocated for code",
      ~c"code.info The total amount of memory currently allocated for Erlang code",
      ~c"code.min 0",
      ~c"ets.label memory allocated for ETS tables",
      ~c"ets.info The total amount of memory currently allocated for ETS tables",
      ~c"ets.min 0"
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    Enum.map(:erlang.memory(), fn {type, size} -> ~c"#{type}.value #{size}" end)
  end
end
