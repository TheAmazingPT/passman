function add_password {
  local prompt account_name menu generated_password password_1 password_2

  prompt="Enter Accountname: (service/username)"
  account_name=$(echo | dmenu -i -p "$prompt")

  if [[ -z "$account_name" ]]; then
    exit
  fi

  prompt="Enter Password:"
  menu="\"Generate Password\""
  password_1=$(echo "$menu"| xargs -n 1 | dmenu -i -p "$prompt")

  if [[ -z "$password_1" ]]; then
    exit
  elif [[ $password_1 == "Generate Password" ]]; then
    generated_password=$(generate_password 32 1)
    password_1=$generated_password
    password_2=$generated_password
  fi

  if [[ -z "$password_2" ]]; then
    prompt="Enter Password again:"
    password_2=$(echo | dmenu -i -p "$prompt")
  fi

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
