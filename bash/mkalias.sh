qconfig_make_aliases() {
  if [[ -f "${QCONFIG_TMP_ALIASES}" ]]; then
    rm -f "${QCONFIG_TMP_ALIASES}"
  fi

  cat >> "${QCONFIG_TMP_ALIASES}" << EOF
# Aliases
# -------------
alias ls='ls ${LS_OPTS}'
alias la='ls ${LA_OPTS}'
alias ll='ls ${LL_OPTS}'
alias grep='grep --color=tty -d skip'
alias df='df -h'
alias bashrc='vim ${QCONFIG_BASHRC}'
alias vimrc='vim ${QCONFIG_VIMRC}'
alias sb='source ${QCONFIG_BASHRC}'
alias add='${PKG_ADD}'
alias remove='${PKG_REMOVE}'
alias search='${PKG_SEARCH}'

EOF

  cp -f "${QCONFIG_TMP_ALIASES}" "${QCONFIG_BASH_ALIASES}"
}
