defmodule Proxy.Mixfile do
  use Mix.Project

  def project do
    [app: :proxy,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger,
                    :cowboy,
                    :plug,
                    :httpoison,
                    :socket,
                    :timex,
                    :observer,
                    :wx,
                    :runtime_tools],
     mod: {Proxy, []}]
  end

  defp deps do
    [{:plug_cowboy, "~> 1.0"},
     {:plug, "~> 1.0"},
     {:exrm, "~> 1.0.0"},
     {:httpoison, "~> 1.6.0"},
     {:socket, "~> 0.3.5"},
     {:timex, "~> 1.0.0"}]
  end
end
