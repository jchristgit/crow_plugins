defmodule CrowPlugins.BEAM.Reductions do
  @moduledoc """
  A graph showcasing the amount of reductions as obtained from `:erlang.statistics(:reductions)`.
  """

  # http://erlang.org/doc/man/erlang.html#statistics-1

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    ~c"beam_reductions"
  end

  @doc false
  @impl true
  def config(_options) do
    [
      ~c"graph_category beam",
      ~c"graph_title reductions",
      ~c"graph_vlabel reductions / second",
      ~c"total.label reductions",
      ~c"total.info The number of reductions per second.",
      ~c"total.min 0",
      ~c"total.type DERIVE"
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {total_reductions, _words_reclaimed} = :erlang.statistics(:reductions)

    [~c"total.value #{total_reductions}"]
  end
end
