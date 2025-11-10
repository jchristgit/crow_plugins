defmodule CrowPlugins.MixProject do
  use Mix.Project

  def project do
    [
      app: :crow_plugins,
      version: "0.2.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      package: package(),
      docs: docs(),
      dialyzer: [plt_add_apps: [:crow]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
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
      {:crow, "~> 0.2"},

      # Linting dependencies
      {:credo, "~> 1.7", only: :dev, runtime: false},
      {:dialyxir, "~> 1.3", only: :dev, runtime: false},

      # Documentation dependencies
      {:ex_doc, "~> 0.18", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      source_ref: "master"
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_), do: ["lib"]
end
