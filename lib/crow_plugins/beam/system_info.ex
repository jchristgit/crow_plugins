defmodule CrowPlugins.BEAM.SystemInfo do
  @moduledoc """
  Display atom, ETS, port and process count and limits using `:erlang.system_info`.

  This plugin also sets `{fieldname}.warning` and `{fieldname}.critical` values for
  its values: warning status is reported if a count is at 70% of the limit, and
  critical status is reported if a count is at 90% of the limit.
  """

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name do
    'beam_system_info'
  end

  @doc false
  @impl true
  def config do
    [
      'graph_args -l 0',
      'graph_category beam',
      'graph_title BEAM system counters',
      'atoms.label total atoms',
      'atoms.info Total atoms existing at the local node',
      'atoms.warning #{warning_value(:atom_limit)}',
      'atoms.critical #{critical_value(:atom_limit)}',
      'ets.label total ETS tables',
      'ets.info Total ETS tables existing at the local node',
      'ets.warning #{warning_value(:ets_limit)}',
      'ets.critical #{critical_value(:ets_limit)}',
      'ports.label total ports',
      'ports.info Total ports existing at the local node',
      'ports.warning #{warning_value(:port_limit)}',
      'ports.critical #{critical_value(:port_limit)}',
      'processes.label total processes',
      'processes.info Total processes existing at the local node',
      'processes.warning #{warning_value(:process_limit)}',
      'processes.critical #{critical_value(:process_limit)}'
    ]
  end

  @doc false
  @impl true
  def values do
    [
      'atoms.value #{:erlang.system_info(:atom_count)}',
      'ets.value #{:erlang.system_info(:ets_count)}',
      'ports.value #{:erlang.system_info(:port_count)}',
      'processes.value #{:erlang.system_info(:process_count)}'
    ]
  end

  defp warning_value(kind) do
    round(:erlang.system_info(kind) * 0.7)
  end

  defp critical_value(kind) do
    round(:erlang.system_info(kind) * 0.9)
  end
end
