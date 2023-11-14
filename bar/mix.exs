defmodule Bar.MixProject do
  use Mix.Project

  def project do
    [
      app: :bar,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:foo, path: "../foo"},
      {:phoenix, "~> 1.7.6"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.10"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.20.0"},
      {:floki, ">= 0.30.0"},
      {:esbuild, "~> 0.7", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.2.0", runtime: Mix.env() == :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:jason, "~> 1.2"},
      {:bandit, "~> 1.0"},
      {:typed_struct, "~> 0.3.0"},
      {:ex_check, "~> 0.15.0", only: [:dev], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:styler, "~> 0.10.0", only: [:dev, :test], runtime: false},
      {:ecto, "~> 3.10.3"},
      {:sentry, "~> 9.1.0"},
      # needed for sentry client
      {:hackney, "~> 1.20.1"},
      {:logger_json, "~> 5.1"},
      {:logger_backends, "~> 1.0.0"},
      {:tz, "~> 0.26.2"},
      {:typed_ecto_schema, "~> 0.4.1"},
      {:ecto_sqlite3, "~> 0.12"}
    ]
  end
end
