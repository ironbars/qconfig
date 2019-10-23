QCONFIG_BASHRC="${HOME}"/.profile
LS_OPTS="-GF"
LA_OPTS="-a ${LS_OPTS}"
LL_OPTS="-l -T ${LS_OPTS}"
PKG_ADD="brew install"
PKG_REMOVE="brew uninstall"
PKG_SEARCH="brew search"
PLATFORM_BASH_DEPS=()
PLATFORM_VIM_DEPS=()
PLATFORM_VIM_PLUGINS=()

qconfig_package_manager() {
  /usr/bin/ruby -e "$(
    curl -fsSL \
    https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

