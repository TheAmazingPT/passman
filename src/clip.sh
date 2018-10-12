function clip {
  echo "$@" | xclip -selection clipboard 1>/dev/null
}
