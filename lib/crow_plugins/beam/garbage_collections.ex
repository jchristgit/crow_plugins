defmodule CrowPlugins.BEAM.GarbageCollections do
  @moduledoc """
  A graph showcasing the total amount of garbage collections as obtained from `:erlang.statistics(:garbage_collections)`.
  """

  # http://erlang.org/doc/man/erlang.html#statistics-1

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    'beam_garbage_collections'
  end

  @doc false
  @impl true
  def config(_options) do
    [
      'graph_category beam',
      'graph_title garbage collections',
      'graph_vlabel gcs / second',
      'total.label garbage collections',
      'total.info The total number of garbage collections per second.',
      'total.min 0',
      'total.type DERIVE'
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {num_gcs, _words_reclaimed, 0} = :erlang.statistics(:garbage_collection)

    ['total.value #{num_gcs}']
  end
end
