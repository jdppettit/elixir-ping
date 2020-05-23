# Ping

A simple wrapper around [gen_icmp](https://github.com/msantos/gen_icmp) to send raw ICMP packets from Elixir.

## Installation

Add to your application dependencies to install:

```elixir
def deps do
  [
    {:ping, "~> 0.1.0"}
  ]
end
```

## Usage

This is currently a very simple library - `ping/1` is the only exposed function, pass it a tuple containing an IP address.

Successful response includes `:ok` and a map of details from `gen_icmp`. 

```
Ping.ping({1,1,1,1})
{:ok, %{elapsed: 23, id: 7339, sequence: 0, ttl: 59}}
```

Timeout:

```
Ping.ping({192,168,0,1})
{:error, :timeout}
```

ICMP error: 

```
{:error, :icmp_error}
```


