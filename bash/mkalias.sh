readonly QCONFIG_TMP_ALIASES="/tmp/aliases.sh"
readonly QCONFIG_BASH_ALIASES="${QCONFIG_BASH_CONF}"/bashrc/10aliases.sh

_make_ls_aliases() {
	echo "alias ls='ls ${LS_OPTS}'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias la='ls ${LA_OPTS}'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias ll='ls ${LL_OPTS}'" >> "${QCONFIG_TMP_ALIASES}"
}

_make_common_aliases() {
	echo "alias grep='grep --color=tty -d skip'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias cp='cp -i'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias df='df -h'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias bashrc='vim ${QCONFIG_BASHRC}'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias vimrc='vim ${QCONFIG_VIMRC}'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias sb='source ${QCONFIG_BASHRC}'" >> "${QCONFIG_TMP_ALIASES}"
}

_make_pkg_mgr_aliases() {
	echo "alias add='${PKG_ADD}'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias remove='${PKG_REMOVE}'" >> "${QCONFIG_TMP_ALIASES}"
	echo "alias search='${PKG_SEARCH}'" >> "${QCONFIG_TMP_ALIASES}"
}

make_aliases() {
	if [[ -f "${QCONFIG_TMP_ALIASES}" ]]; then
		rm -f "${QCONFIG_TMP_ALIASES}"
	fi

	echo '# Aliases' >> "${QCONFIG_TMP_ALIASES}"
	echo '# -------------' >> "${QCONFIG_TMP_ALIASES}"

	_make_ls_aliases
	_make_common_aliases
	_make_pkg_mgr_aliases

	echo "" >> "${QCONFIG_TMP_ALIASES}"
	cp -f "${QCONFIG_TMP_ALIASES}" "${QCONFIG_BASH_ALIASES}"
}
