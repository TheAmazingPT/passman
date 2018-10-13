function select_password {
  local last_password password_list repeat_option menu prompt new_password

  last_password=$1
  password_list=$2

  # Only show option for repeating something, if there is a $last_password
  if [[ -n $last_password ]]; then
    repeat_option="\"[Repeat: $last_password]\""
  else
    repeat_option=""
  fi

  menu=(
    "$repeat_option"
    "\"Add Password\""
    "\"Generate Password\""
    "${password_list[@]}"
  )

  prompt="Passman: search and select!"
  new_password=$(echo "${menu[@]}" | xargs -n 1 | dmenu -i -p "$prompt")

  # There is nothing left to do, if user didn't select an option
  if [[ -z $new_password ]]; then
    exit
  fi

  # Decide if a new password shall be created, generated or an existing shall be
  # copied to clipboard.
  case $new_password in
    "Add Password")
      add_password
      exit
      ;;
    "Generate Password")
      generate_password 32
      exit
      ;;
    "[Repeat: $last_password]")
      echo "$last_password"
      ;;
    *)
      echo "$new_password"
      ;;
  esac
}
