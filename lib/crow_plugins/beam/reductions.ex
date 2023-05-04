defmodule CrowPlugins.BEAM.Reductions do
  @moduledoc """
  A graph showcasing the amount of reductions as obtained from `:erlang.statistics(:reductions)`.
  """

  # http://erlang.org/doc/man/erlang.html#statistics-1

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    'beam_reductions'
  end

  @doc false
  @impl true
  def config(_options) do
    [
      'graph_category beam',
      'graph_title reductions',
      'graph_vlabel reductions / second',
      'total.label reductions',
      'total.info The number of reductions per second.',
      'total.min 0',
      'total.type DERIVE'
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {total_reductions, _words_reclaimed} = :erlang.statistics(:reductions)

    ['total.value #{total_reductions}']
  end
end
