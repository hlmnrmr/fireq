**Minimal requirements:**
2GB RAM, 4GB Free space

## Install a liveblog on fresh Ubuntu 16.04
```sh
curl -s https://raw.githubusercontent.com/superdesk/fireq/master/files/liveblog/install | sudo bash
```

Open your public IP or domain in browser to access liveblog. Use default user with login:**admin** and password:**admin**.

## Install a liveblog in LXC container

###[Prepare LXC](../../docs/lxc.md)

```sh
# initilize new container
(echo name=lb; curl -s https://raw.githubusercontent.com/superdesk/fireq/master/files/liveblog/lxc-init) | sudo bash
# install liveblog to container
curl -s https://raw.githubusercontent.com/superdesk/fireq/master/files/liveblog/install | ssh root@lb
# expose port 80 from container to host
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to-destination $(sudo lxc-info -iH -n lb)
```