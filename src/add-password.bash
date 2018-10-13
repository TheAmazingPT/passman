function add_password {
  local prompt account_name menu generated_password password_1 password_2 \
    pasted_password confirmed_pasted_password

  prompt="Enter Accountname: (service/username)"
  account_name=$(echo | dmenu -i -p "$prompt")

  if [[ -z "$account_name" ]]; then
    exit
  fi

  prompt="Enter Password:"

  menu=(
    "\"Paste from Clipboard\""
    "\"Generate Password\""
  )

  password_1=$(echo "${menu[@]}"| xargs -n 1 | dmenu -i -p "$prompt")

  if [[ -z "$password_1" ]]; then
    exit
  fi

  case $password_1 in
    "Paste from Clipboard")
      pasted_password=$(xclip -o -selection clipboard)
      ;;

    "Generate Password")
      generated_password=$(generate_password 32 1)
      password_1=$generated_password
      password_2=$generated_password
      ;;
  esac

  if [[ -n "$pasted_password" ]]; then
    prompt="Enter Password (pasted):"
    confirmed_pasted_password=$(echo "$pasted_password" | dmenu -i -p "$prompt")
    password_1=$confirmed_pasted_password
    password_2=$confirmed_pasted_password
  fi

  if [[ -z "$pasted_password" && -z "$password_2" ]]; then
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
