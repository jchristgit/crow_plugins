defmodule CrowPlugins.BEAM.GarbageCollections do
  @moduledoc """
  A graph showcasing the total amount of garbage collections as obtained from `:erlang.statistics(:garbage_collections)`.
  """

  # http://erlang.org/doc/man/erlang.html#statistics-1

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    ~c"beam_garbage_collections"
  end

  @doc false
  @impl true
  def config(_options) do
    [
      ~c"graph_category beam",
      ~c"graph_title garbage collections",
      ~c"graph_vlabel gcs / second",
      ~c"total.label garbage collections",
      ~c"total.info The total number of garbage collections per second.",
      ~c"total.min 0",
      ~c"total.type DERIVE"
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {num_gcs, _words_reclaimed, 0} = :erlang.statistics(:garbage_collection)

    [~c"total.value #{num_gcs}"]
  end
end
