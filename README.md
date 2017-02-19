# PingPong

Based on the Elixir Daily Drip [episode 001.4 Processes and Messaging](https://www.dailydrip.com/topics/elixir/drips/processes-and-messaging-08687de7-07c6-4cc3-b6c6-4398d137820c)

`iex -S mix`

```
  ping = spawn(PingPong, :start, [500])
  pong = spawn(PingPong, :start, [500])
  send(ping, {:pong, pong})
```

A couple notes:

* Named the actual class PingPong instead of Ping
* Elixir 1.4 requires () for method invocations with no arguments 
  * See this [discussion](https://groups.google.com/forum/#!topic/elixir-lang-core/Otz0uuML764)
* Added a test for the pong response
* Moved the sleep time out to a delay
  * Now the tests pass (assert_receive requires a response in < 100 ms)
  * This reminded me that the [] for arg 3 of spawn is the args for the message sent
