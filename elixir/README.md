# 12factor + elixir + immortal

> Twelve-factor app processes should never daemonize or write PID files. Instead, rely on the operating system’s process manager (such as Upstart, a distributed process manager on a cloud platform, or a tool like Foreman in development) to manage output streams, respond to crashed processes, and handle user-initiated restarts and shutdowns. https://12factor.net/concurrency

A word of caution, erlang  has its own supervisor model and probably is the best way to use it to take full advantage of the language, the approach presented here is only for demonstrative purposes but far from being a best practices due the nature of erlang supervisor model.

# Run

    docker run -it --privileged -p 8080:8080 elixir

Within the container check the status of the service by typing:

    root@15c033674b4e:/# immortalctl
    PID     Up   Down   Name     CMD
     22   2.6s          elixir   mix run --no-halt

Check the logs:

    root@15c033674b4e:/# tail -F /tmp/elixir.log
    2017-07-29T09:16:44.50917388Z
    2017-07-29T09:16:44.509229784Z 09:16:44.508 [info]  Started application

From your host (laptop/desktop):

    $ curl localhost:8080
    Hello World!

# stop * start

    immortalctl stop elixir

Then to check:

    root@15c033674b4e:/# immortalctl
    PID   Up    Down   Name     CMD
     22        13.9s   elixir   mix run --no-halt

To start the service again:

    root@15c033674b4e:/# immortalctl start elixir
    PID     Up   Down   Name     CMD
    100   0.0s          elixir   mix run --no-halt
