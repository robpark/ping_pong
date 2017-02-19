defmodule PingPongTest do
  use ExUnit.Case
  doctest PingPong

  test "it responds to a pong with a ping" do
    ping = spawn(PingPong, :start, [])
    send(ping, {:pong, self()})
    assert_receive {:ping, to}
    assert to == ping
  end

  test "it responds to a ping with a pong" do
    ping = spawn(PingPong, :start, [])
    send(ping, {:ping, self()})
    assert_receive {:pong, to}
    assert to == ping
  end

  test "it responds to 2 messages" do
    ping = spawn(PingPong, :start, [])
    send(ping, {:pong, self()})
    assert_receive {:ping, _}
    send(ping, {:pong, self()})
    assert_receive {:ping, to}
    assert to == ping
  end
end
