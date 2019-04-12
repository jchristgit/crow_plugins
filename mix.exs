defmodule CrowPlugins.MixProject do
  use Mix.Project

  def project do
    [
      app: :crow_plugins,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [],
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      description: "Plugins for the Crow munin node",
      licenses: ["ISC"],
      links: %{
        "Documentation" => "https://hexdocs.pm/crow_plugins",
        "GitHub" => "https://github.com/jchristgit/crow_plugins"
      },
      maintainers: ["Johannes Christ"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crow, "~> 0.1"},

      # Linting dependencies
      {:credo, "~> 1.0", only: :dev, runtime: false},
    ]
  end
end
