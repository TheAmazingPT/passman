function generate_password {
  local default_length length generated_password trimmed_password

  default_length=32
  length=${1:-$default_length}

  generated_password="$(head -c 512 /dev/urandom | sha512sum | base64)"
  trimmed_password="$(echo "$generated_password" | head -c "$length")"

  clip "$trimmed_password"
  notification "New password generated!" 1>/dev/null
}
