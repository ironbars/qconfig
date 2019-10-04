QCONFIG_BASHRC="${HOME}"/.profile
LS_OPTS="-GF"
LA_OPTS="-a -GF"
LL_OPTS="-l -GFT"
PKG_ADD="brew install"
PKG_REMOVE="brew uninstall"
PKG_SEARCH="brew search"

configure_package_manager() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

