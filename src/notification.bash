function notification {
  local title description

  title=$1
  description=$2

  notify-send -u low -t 15000 "$title" "$description"
}
