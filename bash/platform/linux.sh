_LS_TIMESTYLE='--time-style=+"%Y.%m.%d %H:%M"'
QCONFIG_BASHRC="${HOME}"/.bashrc
LS_OPTS="-F --group-directories-first ${_LS_TIMESTYLE} --color=auto"
LA_OPTS="-a ${LS_OPTS}"
LL_OPTS="-l ${LS_OPTS}"

qconfig_check_linux() {
  local os="$(grep '^ID=' /etc/os-release | cut -f2 -d"=")"

  case "${os}" in
    "arch")
      source "${QCONFIG_BASH_CONF}"/platform/linux/arch.sh
      ;;
    "fedora")
      source "${QCONFIG_BASH_CONF}"/platform/linux/fedora.sh
      ;;
    "ubuntu")
      source "${QCONFIG_BASH_CONF}"/platform/linux/debian.sh
      ;;
    "debian")
      source "${QCONFIG_BASH_CONF}"/platform/linux/debian.sh
      ;;
    *)
      die "Unsupported OS"
      ;;
  esac
}
