# crow_plugins

crow_plugins supplies a number of plugins for [`crow`](https://github.com/jchristgit/crow).
Currently, the following plugins are supplied:

- `CrowPlugins.BEAM.ContextSwitches`: Graphs context switches performed.
- `CrowPlugins.BEAM.GarbageCollections`: Graphs garbage collections performed.
- `CrowPlugins.BEAM.IO`: Graphs bytes sent and received through ports.
- `CrowPlugins.BEAM.Memory`: Graphs total memory usage, memory allocation & usage for
  processes, atoms, binaries, ETS tables, and the emulator itself.
- `CrowPlugins.BEAM.SystemInfo`: Graphs internal VM counters, such as the total
  number of atoms, ETS tables, ports, and processes. Warning and critical values
  are configured.


## Installation

Simply add `crow_plugins` to your `mix.exs`:

```elixir
def deps do
  [
    {:crow_plugins, "~> 0.1"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/crow_plugins](https://hexdocs.pm/crow_plugins).

