#! /bin/sh

if [[ ! -f git-user ]]; then
  echo "please run from repo directory"
  exit 1
fi

# TODO(salty) mv or rm existing non-link files out of the way?
make_link() {
  local src="$1"
  local dst="${HOME}/$2"
  if [[ ! -h "${dst}" ]]; then
    local cmd="ln -s ${src} ${dst}"
    echo "\$ ${cmd}"
    $cmd
  fi
}

# symlink into this repo
if [[ ! -d "${HOME}/bin" ]]; then
  mkdir "${HOME}/bin";
fi
for link in git-*; do
  make_link "${PWD}/${link}" "bin/${link}"
done
