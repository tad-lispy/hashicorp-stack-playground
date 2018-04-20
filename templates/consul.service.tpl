[Unit]

Description=Consul Agent
Requires=network-online.target
After=network-online.target

[Service]

EnvironmentFile=-/etc/sysconfig/consul
Environment=GOMAXPROCS=2
Restart=on-failure
ExecStart=/usr/local/sbin/consul agent -config-dir=/etc/consul.d
ExecReload=/bin/kill -HUP $MAINPID
KillSignal=SIGINT

[Install]

WantedBy=multi-user.target
