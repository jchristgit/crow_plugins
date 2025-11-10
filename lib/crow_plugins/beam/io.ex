defmodule CrowPlugins.BEAM.IO do
  @moduledoc "Displays the total number of bytes received and sent through ports."

  # http://erlang.org/doc/man/erlang.html#statistics-1

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    ~c"beam_io"
  end

  @doc false
  @impl true
  def config(_options) do
    [
      ~c"graph_args -l 0 --base 1024",
      ~c"graph_title bytes received and sent through ports",
      ~c"graph_category beam",
      ~c"graph_vlabel bytes in (-) / out (+) per second",
      ~c"in.graph no",
      ~c"in.label bytes",
      ~c"in.min 0",
      ~c"in.type DERIVE",
      ~c"in.draw AREA",
      # This is the only label shown for the graph.
      ~c"out.label bytes",
      ~c"out.negative in",
      ~c"out.min 0",
      ~c"out.type DERIVE",
      ~c"out.draw AREA"
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    {{:input, received}, {:output, sent}} = :erlang.statistics(:io)

    [
      ~c"in.value #{received}",
      ~c"out.value #{sent}"
    ]
  end
end
