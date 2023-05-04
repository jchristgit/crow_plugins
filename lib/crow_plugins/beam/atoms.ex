defmodule CrowPlugins.BEAM.Atoms do
  @moduledoc """
  Display atom count and limits using `:erlang.system_info`.

  This plugin also sets `{fieldname}.warning` and `{fieldname}.critical` values for
  its values: warning status is reported if a count is at 70% of the limit, and
  critical status is reported if a count is at 90% of the limit.
  """

  @behaviour Crow.Plugin

  @doc false
  @impl true
  def name(_options) do
    'beam_atoms'
  end

  @doc false
  @impl true
  def config(_options) do
    [
      'graph_category beam',
      'graph_title atoms',
      'atoms.min 0',
      'atoms.label total atoms',
      'atoms.info Total atoms existing at the local node',
      'atoms.warning #{warning_value(:atom_limit)}',
      'atoms.critical #{critical_value(:atom_limit)}'
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    [
      'atoms.value #{:erlang.system_info(:atom_count)}'
    ]
  end

  defp warning_value(kind) do
    round(:erlang.system_info(kind) * 0.7)
  end

  defp critical_value(kind) do
    round(:erlang.system_info(kind) * 0.9)
  end
end
