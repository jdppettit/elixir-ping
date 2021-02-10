defmodule Ping.MixProject do
  use Mix.Project

  def project do
    [
      app: :ping,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :gen_icmp]
    ]
  end

  defp deps do
    [
      {:gen_icmp, git: "https://github.com/msantos/gen_icmp"}
    ]
  end

  defp description do
    """
      Simple library that wraps `gen_icmp` Erlang library.

      Allows basic ping.
    """
  end

  defp package do
    [
      name: "ping",
      links: %{"GitHub": "https://github.com/silverp1/elixir-ping"},
      licenses: ["MIT"]
    ]
  end
end
