dir() {
  mkdir -p $1
  cd $1
}

edit() {
  code ${1:-.} # Default to .
}

tree() {
  command tree -I 'node_modules' -I 'target' "$@"
}
