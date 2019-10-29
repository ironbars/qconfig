readonly _RED="$(tput setaf 1)"
readonly _YELLOW="$(tput setaf 3)"
readonly _NC="$(tput sgr 0)"

die() {
  echo "$@" >&2
  exit 1
}

red_echo() {
  echo "${_RED}$@${_NC}"
}

yellow_echo() {
  echo "${_YELLOW}$@${_NC}"
}

finish() {
  result=$?

  [[ -f "${QCONFIG_TMP_BASHRC}" ]] && rm -f "${QCONFIG_TMP_BASHRC}"
  [[ -f "${QCONFIG_TMP_ALIASES}" ]] && rm -f "${QCONFIG_TMP_ALIASES}"
  [[ -d "${QCONFIG_TMP_VIM_DIR}" ]] && rm -rf "${QCONFIG_TMP_VIM_DIR}"

  exit "${result}"
}

