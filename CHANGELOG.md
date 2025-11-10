# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic
Versioning](https://semver.org/spec/v2.0.0.html).


## Unreleased


## v0.2.1 - 2025-11-10

### Added

### Changed

- `CrowPlugins.BEAM.IO` now emits an area graph.
- Fix deprecation warnings on newer Elixir versions related to using single
  quotes for charlists.

### Removed

- Lower limits for graphs have been removed for better display.


## v0.2.0 and below

### Added

- `CrowPlugins.BEAM.Atoms` plugin: Counts atoms on the local node.
- `CrowPlugins.BEAM.ContextSwitches` plugin: Counts context switches in the VM.
- `CrowPlugins.BEAM.GarbageCollections` plugin: Counts garbage collections in
  the VM.
- `CrowPlugins.BEAM.ETS` plugin: Instruments ETS table memory usage or item
  count, depending on configuration.
- `CrowPlugins.BEAM.IO` plugin: Monitors bytes sent and received through ports.
- `CrowPlugins.BEAM.Memory` plugin: Monitors memory usage of the VM.
- `CrowPlugins.BEAM.Reductions` plugin: Monitors VM reductions.
- `CrowPlugins.BEAM.SystemInfo` plugin: Monitors system counters of the VM.


<!-- vim: set textwidth=80 sw=2 ts=2: -->
