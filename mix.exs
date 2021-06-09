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
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:gen_icmp, git: "https://github.com/msantos/gen_icmp.git"},
      {:procket, git: "https://github.com/msantos/procket.git", override: true},
      {:pkt, git: "https://github.com/msantos/pkt.git", override: true}
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
