function add_password {
  local prompt="Enter Accountname:"
  local account_name=$(echo | dmenu -i -p "$prompt")

  local prompt="Enter Password:"
  local password_1=$(echo | dmenu -i -p "$prompt")

  local prompt="Enter Password again:"
  local password_2=$(echo | dmenu -i -p "$prompt")

  if [[ $password_1 == $password_2 ]]; then
    echo "$password_1" | pass insert --echo "$account_name" 1>/dev/null
    notification "New password was created!" "$account_name"
  else
    notification "Passwords didn't match!"
  fi
}
