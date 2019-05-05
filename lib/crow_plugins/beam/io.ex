defmodule CrowPlugins.BEAM.IO do
  @moduledoc "Displays the total number of bytes received and sent through ports."

  # http://erlang.org/doc/man/erlang.html#statistics-1

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name do
    'beam_io'
  end

  @doc false
  @impl true
  def config do
    [
      'graph_args -l 0 --base 1024',
      'graph_title bytes received and sent through ports',
      'graph_category beam',
      'graph_vlabel bytes in (-) / out (+)',
      'in.graph no',
      'in.label bytes',
      'in.min 0',
      'in.type DERIVE',
      'out.label bytes',  # This is the only label shown for the graph.
      'out.negative in',
      'out.min 0',
      'out.type DERIVE'
    ]
  end

  @doc false
  @impl true
  def values do
    {{:input, received}, {:output, sent}} = :erlang.statistics(:io)

    [
      'in.value #{received}',
      'out.value #{sent}'
    ]
  end
end
