function select_password {
  local last_password=$1
  local password_list=$2

  local menu="\"[Repeat: $last_password]\" \"Add Password\" \"Generate Password\""
  local selection="$menu $password_list"

  local prompt="Passman: search and select!"
  local new_password=$(echo $selection | xargs -n 1 | dmenu -i -p "$prompt")

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
      generate_password
      exit
      ;;
    "[Repeat: $last_password]")
      echo $last_password
      ;;
    *)
      echo $new_password
      ;;
  esac
}
