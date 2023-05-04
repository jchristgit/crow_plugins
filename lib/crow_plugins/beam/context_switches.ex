defmodule CrowPlugins.BEAM.ContextSwitches do
  @moduledoc "A plugin monitoring `:erlang.statistics(:context_switches)`."

  # http://erlang.org/doc/man/erlang.html#statistics-1<Paste>

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    'beam_context_switches'
  end

  @doc false
  @impl true
  def config(_options) do
    [
      'graph_args --base 1000',
      'graph_category beam',
      'graph_vlabel switches / second',
      'graph_title context switches',
      'total.label context switches',
      'total.min 0',
      'total.type DERIVE'
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {switches, 0} = :erlang.statistics(:context_switches)

    ['total.value #{switches}']
  end
end
