function add_password {
  local prompt="Enter Accountname:"
  local account_name=$(echo | dmenu -i -p "$prompt")

  if [[ -z $account_name ]]; then
    exit
  fi

  local prompt="Enter Password:"
  local password_1=$(echo | dmenu -i -p "$prompt")

  if [[ -z $password_1 ]]; then
    exit
  fi

  local prompt="Enter Password again:"
  local password_2=$(echo | dmenu -i -p "$prompt")

  if [[ -z $password_2 ]]; then
    exit
  fi

  if [[ $password_1 == $password_2 ]]; then
    echo "$password_1" | pass insert --echo "$account_name" 1>/dev/null
    notification "New password was created!" "$account_name"
  else
    notification "Passwords didn't match!"
  fi
}
