function select_password_action {
  local account menu action user password code

  # Exit the program if no account has been given to this function
  if [[ -z $1 ]]; then
    exit 1
  else
    account=$1
  fi

  menu=(
    "\"Copy [u]sername\""
    "\"Copy pass[w]ord\""
    "\"Copy O[T]P\""
  )

  action=$(echo "${menu[@]}" | xargs -n 1 | dmenu -i -p "$account")

  case $action in

    "Copy [u]sername")
      user="$(echo "$account" | cut -d/ -f2)"
      clip "$user"
      notification "Username copied!"
      ;;

    "Copy pass[w]ord")
      password=$(pass show "$account" | head -n 1)
      clip "$password"
      notification "Password copied!"
      ;;

    "Copy O[T]P")
      code=$(pass otp code "$account")
      clip "$code"
      notification "One Time Password copied!"
      ;;

  esac
}
