function add_password {
  local prompt account_name password_1 password_2

  prompt="Enter Accountname: (service/username)"
  account_name=$(echo | dmenu -i -p "$prompt")

  if [[ -z "$account_name" ]]; then
    exit
  fi

  prompt="Enter Password:"
  password_1=$(echo | dmenu -i -p "$prompt")

  if [[ -z "$password_1" ]]; then
    exit
  fi

  prompt="Enter Password again:"
  password_2=$(echo | dmenu -i -p "$prompt")

  if [[ -z "$password_2" ]]; then
    exit
  fi

  if [[ "$password_1" == "$password_2" ]]; then
    echo "$password_1" | pass insert --echo "$account_name" 1>/dev/null
    notification "New password was created!" "$account_name"
  else
    notification "Passwords didn't match!"
  fi
}
