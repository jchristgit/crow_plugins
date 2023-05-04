defmodule CrowPlugins.BEAM.IO do
  @moduledoc "Displays the total number of bytes received and sent through ports."

  # http://erlang.org/doc/man/erlang.html#statistics-1

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    'beam_io'
  end

  @doc false
  @impl true
  def config(_options) do
    [
      'graph_args -l 0 --base 1024',
      'graph_title bytes received and sent through ports',
      'graph_category beam',
      'graph_vlabel bytes in (-) / out (+) per second',
      'in.graph no',
      'in.label bytes',
      'in.min 0',
      'in.type DERIVE',
      # This is the only label shown for the graph.
      'out.label bytes',
      'out.negative in',
      'out.min 0',
      'out.type DERIVE'
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {{:input, received}, {:output, sent}} = :erlang.statistics(:io)

    [
      'in.value #{received}',
      'out.value #{sent}'
    ]
  end
end
