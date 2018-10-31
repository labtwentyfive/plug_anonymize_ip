defmodule PlugAnonymizeIp.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_anonymize_ip,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      preferred_cli_env: [
        "test.watch": :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      docs: [
        extras: ~W(README.md)
      ],
      source_url: "https://github.com/labtwentyfive/plug_anonymize_ip",
      test_coverage: [tool: ExCoveralls]
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
      {:plug, "~> 1.5 or ~> 1.7"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 1.2", only: :dev},
      {:mix_test_watch, "~> 0.9.0", only: :test}
    ]
  end

  def description do
    """
    A plug to anonymize request IP addresses.
    """
  end

  def package do
    [
      licenses: ["MIT"],
      maintainers: ["Michael Schaefermeyer", "Sven Grunewaldt"],
      links: %{
        "GitHub" => "https://github.com/labtwentyfive/plug_anonymize_ip",
        "lab25" => "https://www.lab25.de/"
      }
    ]
  end
end
