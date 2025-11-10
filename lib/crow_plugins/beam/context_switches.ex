defmodule CrowPlugins.BEAM.ContextSwitches do
  @moduledoc "A plugin monitoring `:erlang.statistics(:context_switches)`."

  # http://erlang.org/doc/man/erlang.html#statistics-1<Paste>

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    ~c"beam_context_switches"
  end

  @doc false
  @impl true
  def config(_options) do
    [
      ~c"graph_args --base 1000",
      ~c"graph_category beam",
      ~c"graph_vlabel switches / second",
      ~c"graph_title context switches",
      ~c"total.label context switches",
      ~c"total.min 0",
      ~c"total.type DERIVE"
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {switches, 0} = :erlang.statistics(:context_switches)

    [~c"total.value #{switches}"]
  end
end
