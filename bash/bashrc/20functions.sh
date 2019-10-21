# Functions
# -------------
# ex - archive extractor
# usage: ex <archive>
ex () {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)
        tar xjf "$1"
        ;;
      *.tar.gz) 
        tar xzf "$1"
        ;;
      *.bz2)
        bunzip2 "$1"
        ;;
      *.rar)
        unrar x "$1"
        ;;
      *.gz)
        gunzip "$1"
        ;;
      *.tar)
        tar xf "$1"
        ;;
      *.tbz2)
        tar xjf "$1"
        ;;
      *.tgz)
        tar xzf "$1"
        ;;
      *.zip)
        unzip "$1"
        ;;
      *.Z)
        uncompress "$1"
        ;;
      *.7z)
        7z x "$1"
        ;;
      *)
        echo "'$1' cannot be extracted via ex()"
        return 1
        ;;
    esac

  else
    echo "'$1' is not a valid file"
    return 1
  fi
}

# csource - compile and execute C source on the fly
# usage: csource <source_file>
csource () {
  if [ -z "$1" ]; then
    echo "Missing operand"
    return 1
  fi

  local output_path="$(
    echo "$1" | 
    sed -e "s/^.*\/\|^/\/tmp\//" | 
    sed -e "s/\.c$//"
  )"

  gcc "$1" -o "${output_path}" && "${output_path}";
  rm "${output_path}"

  return 0
}

# cl - cd and ls in one command
# usage: cl <directory>
cl () {
  local dir="$1"
  if [[ -z "$dir" ]]; then
    dir="${HOME}"
  fi
  if [[ -d "${dir}" || "${dir}" == "-" ]]; then
    cd "$dir"
    ls
  else
    echo "bash: cl: '${dir}': Directory not found"
    return 1
  fi
}

utime() {
  i=1
  
  while [[ ${i} -gt 0 ]]; do
    echo "${i} seconds"
    (i++)
    sleep 1
  done
}

# gitup - update local "production" branches with remote changes
gitup () {
  local wanted="master"
  local current="$(git rev-parse --abbrev-ref HEAD)"

  for branch in "dev" "master"; do
    git checkout "${branch}"
    git pull origin "${branch}"
  done

  if [[ "${current}" != "${wanted}" ]]; then
    git checkout "${wanted}"
  fi
}

# gitclean - remove branches that aren't needed any longer
# usage: gitclean (inside of a git repository)
gitclean () {
  declare -a branches="$(
    git branch | 
    sed 's/^[^a-zA-Z0-9]*//'g |
    egrep -v "^dev|^master"
  )"

  for branch in "${branches[@]}"; do
    git branch -d "${branch}"
  done
}

# gitready - clean up local git repository
gitready () {
  gitup
  gitclean
}

# gitpr - push current branch to remote to set up pull request
gitpr () {
  local current="$(git rev-parse --abbrev-ref HEAD)"

  if [[ "${current}" == "master" || "${current}" == "dev" ]]; then
    echo "ERROR: attempted to push directly to production branches"
    echo "Exiting"
    return 1
  fi

  git push origin "${current}"
}

