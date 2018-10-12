function generate_password {
  local default_length=32
  local length=${1:-$default_length}

  local generated_password=$(head -c 512 /dev/urandom | sha512sum | base64)
  local trimmed_password=$(echo $generated_password | head -c $length)

  clip "$trimmed_password"
  notification "New password generated!" "$trimmed_password" 1>/dev/null
}
