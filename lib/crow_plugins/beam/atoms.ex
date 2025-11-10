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
    ~c"beam_atoms"
  end

  @doc false
  @impl true
  def config(_options) do
    [
      ~c"graph_category beam",
      ~c"graph_title atoms",
      ~c"atoms.min 0",
      ~c"atoms.label total atoms",
      ~c"atoms.info Total atoms existing at the local node",
      ~c"atoms.warning #{warning_value(:atom_limit)}",
      ~c"atoms.critical #{critical_value(:atom_limit)}"
    ]
  end

  @doc false
  @impl true
  def values(_options) do
    [
      ~c"atoms.value #{:erlang.system_info(:atom_count)}"
    ]
  end

  defp warning_value(kind) do
    round(:erlang.system_info(kind) * 0.7)
  end

  defp critical_value(kind) do
    round(:erlang.system_info(kind) * 0.9)
  end
end
