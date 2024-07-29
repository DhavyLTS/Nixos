{ vars, ...} : {
	networking.networkmanager.enable = true;
	networking.hostName = "${vars.hostname}";

	networking.firewall.enable = true;
	networking.nat.enable = true;

	networking.firewall.extraCommands = ''
		iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
		iptables -A INPUT ! -i ppp0 -j ACCEPT

		iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
		iptables -A FORWARD -i enp0s20f0u2 -o ppp0 -j ACCEPT
		iptables -A FORWARD -i br0 -o ppp0 -j ACCEPT

		iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
	'';

	networking.firewall.extraStopCommands = ''
		iptables -D INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
		iptables -D INPUT ! -i ppp0 -j ACCEPT

		iptables -D FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
		iptables -D FORWARD -i enp0s20f0u2 -o ppp0 -j ACCEPT
		iptables -D FORWARD -i br0 -o ppp0 -j ACCEPT

		iptables -t nat -D POSTROUTING -o ppp0 -j MASQUERADE
	'';

	boot.kernel.sysctl = {
		"net.ipv4.conf.all.forwarding" = true;
		"net.ipv4.ip_forward" = true;
	};
}
