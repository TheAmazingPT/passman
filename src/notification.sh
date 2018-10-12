function notification {
  local title=$1
  local description=$2

  notify-send -u low -t 15000 "$title" "$description"
}
