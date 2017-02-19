defmodule PingPong do
  def start(delay \\ 0), do: _loop(delay)

  defp _loop(delay) do
    receive do
      {:pong, from} ->
        IO.puts "ping ->"
        :timer.sleep delay
        send(from, {:ping, self()})
      {:ping, from} ->
        IO.puts "         -> pong"
        :timer.sleep delay
        send(from, {:pong, self()})
    end
    _loop(delay)
  end
end
