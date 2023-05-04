defmodule CrowPlugins.BEAM.SystemInfo do
  @moduledoc """
  Display ETS, port and process count and limits, and active socket count.

  This plugin also sets `{fieldname}.warning` and `{fieldname}.critical` values
  for its values (except for the socket count): warning status is reported if a
  count is at 70% of the limit, and critical status is reported if a count is
  at 90% of the limit.

  ## Configuration

  This plugin accepts the following options:

  - `{:scale, :logarithmic}`: Use logarithmic y-axis scaling. By default,
  linear scaling will be used.
  """

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    'beam_system_info'
  end

  @doc false
  @impl true
  def config(options) do
    [
      'graph_args #{graph_args(options)}',
      'graph_category beam',
      'graph_title vm counters',
      'ets.label total ETS tables',
      'ets.info Total ETS tables existing at the local node',
      'ets.warning #{warning_value(:ets_limit)}',
      'ets.critical #{critical_value(:ets_limit)}',
      'ets.min 0',
      'ports.label total ports',
      'ports.info Total ports existing at the local node',
      'ports.warning #{warning_value(:port_limit)}',
      'ports.critical #{critical_value(:port_limit)}',
      'ports.min 0',
      'processes.label total processes',
      'processes.info Total processes existing at the local node',
      'processes.warning #{warning_value(:process_limit)}',
      'processes.critical #{critical_value(:process_limit)}',
      'processes.min 0',
      'sockets.label active processes',
      'sockets.info Active sockets on the local node',
      'sockets.min 0'
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    [
      'ets.value #{:erlang.system_info(:ets_count)}',
      'ports.value #{:erlang.system_info(:port_count)}',
      'processes.value #{:erlang.system_info(:process_count)}',
      'sockets.value #{:socket.number_of()}'
    ]
  end

  defp warning_value(kind) do
    round(:erlang.system_info(kind) * 0.7)
  end

  defp critical_value(kind) do
    round(:erlang.system_info(kind) * 0.9)
  end

  defp graph_args(scale: :logarithmic), do: '--logarithmic'
  defp graph_args([]), do: ''
end
