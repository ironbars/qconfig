_LS_TIMESTYLE='--time-style=+"%Y.%m.%d %H:%M"'
QCONFIG_BASHRC="${HOME}"/.bashrc
LS_OPTS="-F --group-directories-first ${_LS_TIMESTYLE} --color=auto"
LA_OPTS="-a ${LS_OPTS}"
LL_OPTS="-l ${LS_OPTS}"
PLATFORM_BASH_DEPS=()
PLATFORM_VIM_DEPS=()
PLATFORM_VIM_PLUGINS=(
  "https://github.com/alok/notational-fzf-vim.git"
  "https://github.com/ironbars/nvlinks.git"
)
  

qconfig_check_linux() {
  local os="$(grep '^ID=' /etc/os-release | cut -f2 -d"=")"

  case "${os}" in
    "arch")
      source "${QCONFIG_HOME}"/platform/linux/arch.sh
      ;;
    "fedora")
      source "${QCONFIG_HOME}"/platform/linux/fedora.sh
      ;;
    "ubuntu"|"debian")
      source "${QCONFIG_HOME}"/platform/linux/debian.sh
      ;;
    *)
      die "Unsupported OS"
      ;;
  esac
}
