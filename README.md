# crow_plugins

`crow_plugins` supplies a number of plugins for
[`crow`](https://github.com/jchristgit/crow). Currently, the following plugins
are supplied:

- `CrowPlugins.BEAM.Atoms`: Counts atoms on the local node.
- `CrowPlugins.BEAM.ContextSwitches`: Counts context switches in the VM.
- `CrowPlugins.BEAM.GarbageCollections`: Counts garbage collections in the VM.
- `CrowPlugins.BEAM.ETS`: Instruments ETS table memory usage or item count,
  depending on configuration.
- `CrowPlugins.BEAM.IO`: Monitors bytes sent and received through ports.
- `CrowPlugins.BEAM.Memory`: Monitors memory usage of the VM.
- `CrowPlugins.BEAM.Reductions`: Monitors VM reductions.
- `CrowPlugins.BEAM.SystemInfo`: Monitors system counters and active sockets of
  the VM.


## Installation

Simply add `crow_plugins` to your `mix.exs`:

```elixir
def deps do
  [
    {:crow_plugins, "~> 0.2"}
  ]
end
```

Then configure `:crow` with the plugins you want, for example:

```elixir
# config/config.exs
config :crow,
  ip: {127, 0, 0, 1},
  port: 4950,
  plugins: [
    CrowPlugins.BEAM.Atoms,
    CrowPlugins.BEAM.ContextSwitches,
    CrowPlugins.BEAM.GarbageCollections,
    CrowPlugins.BEAM.IO,
    CrowPlugins.BEAM.Memory,
    CrowPlugins.BEAM.Reductions,
    CrowPlugins.BEAM.SystemInfo
  ]
```

Documentation can be found at [https://hexdocs.pm/crow_plugins](https://hexdocs.pm/crow_plugins).

