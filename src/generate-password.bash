function generate_password {
  local default_length length use_echo generated_password trimmed_password

  default_length=32
  length=${1:-$default_length}
  use_echo=${2:-0}

  generated_password="$(head -c 512 /dev/urandom | sha512sum | base64)"
  trimmed_password="$(echo "$generated_password" | head -c "$length")"

  if [[ use_echo -eq 1 ]]; then
    notification "New password generated!" 1>/dev/null
    echo "$trimmed_password"
  else
    notification "New password generated!" 1>/dev/null
    clip "$trimmed_password"
  fi
}
