defmodule CrowPlugins.BEAM.ContextSwitches do
  @moduledoc "A plugin monitoring `:erlang.statistics(:context_switches)`."

  # http://erlang.org/doc/man/erlang.html#statistics-1<Paste>

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name do
    'beam_context_switches'
  end

  @doc false
  @impl true
  def config do
    [
      'graph_args -l 0',
      'graph_category beam',
      'graph_title context switches',
      'total.label context switches',
      'total.min 0',
      'total.type DERIVE',
      'total.info The total number of context switches since the system has started.'
    ]
  end

  @doc false
  @impl true
  def values do
    {switches, 0} = :erlang.statistics(:context_switches)

    ['total.value #{switches}']
  end
end
