QCONFIG_BASHRC="${HOME}"/.bashrc
LS_OPTS='--group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
LA_OPTS='-a --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
LL_OPTS='-l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

os="$(grep '^ID' /etc/os-release | cut -f2 -d"=")"

case "${os}" in
	"arch")
		source "${QCONFIG_HOME}"/bash/platform/linux/arch.sh
		;;
	"fedora")
		source "${QCONFIG_HOME}"/bash/platform/linux/fedora.sh
		;;
	*)
		die "Unsupported OS"
		;;
esac
