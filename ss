---
tags [ networking,linux ]
---

Args
-4/-6 list ipv4/ipv6 sockets
-a all
-n numeric addresses instead of hostnames
-l list listing sockets
-u/-t/-x list udp/tcp/unix sockets
-p Show process(es) that using socket
-r Resolves remote hostnames
-w raw
-x unix

# show all listing tcp sockets including the corresponding process
ss -tlp

# show all sockets connecting to 192.168.2.1 on port 80
ss -t dst 192.168.2.1:80

# show all ssh related connection
ss -t state established '( dport = :ssh or sport = :ssh )'

# system processes
ss -xa | grep systemd

# all sockets to the outside world
ss -tuwl

# to see the domain names
ss -tpr


# all http connections
ss -t dst 132.181.109.79 OR ss -t src 132.181.109.79
ss -t dport = :http

# established TCP connections
ss -t state established

# by port number
ss -tln sport = :443

# Netid = displays the socket type and transport protocol

# State = is the socket state, which are the standard TCP states. You'll see ESTAB and LISTEN the most. UNCONN, unconnected, is the same as LISTEN.

# Recv-Q and Send-Q = display the amount of data queued for receiving and sending, in bytes, packages waiting to be processed or ack

# Local Address:Port = is the open socket on your computer, and Peer is the address of the remote connection, if there is one. *:* means all IPv4 addresses, and :::* means all IPv6 addresses
