defmodule Ping do
  def ping(host) do
    with {:ok, true} <- validate_host(host),
         {:ok, _host, _address, _repyaddr, 
            {id, seq, ttl, elapsed, } = details, _
         } <- do_ping(host)
    do
      {:ok, %{elapsed: elapsed, id: id, sequence: seq, ttl: ttl}}
    else
      {:error, :timeout, _host, _address} ->
        {:error, :timeout}
      {:error, _, _, _, _, _} ->
        {:error, :icmp_error}
      {:ok, false} ->
        {:error, :invalid_host}
      {:error, {:error, :eperm}} ->
        {:error, :permission_error}
    end
  end

  def validate_host(host) do
    valid? = host
    |> Tuple.to_list
    |> Enum.reduce(0, fn item, acc -> 
      if is_integer(item) do
        acc = acc + 1
      else
        acc
      end
    end)
    |> (fn check -> 
      check == 4
    end).()
    {:ok, valid?}
  end

  def do_ping(host) do
    # Returns a list to facilitate more than one  simultaneous checks
    List.first(:gen_icmp.ping(host, [:inet]))
  end
end
