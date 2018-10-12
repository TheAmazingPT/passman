function select_password_action {
  # Exit the program if no account has been given to this function
  if [[ -z $1 ]]; then
    exit 1
  else
    local account=$1
  fi

  menu="\"Copy [u]sername\" \"Copy pass[w]ord\" \"Copy O[T]P\""
  action=$(echo "$menu" | xargs -n 1 | dmenu -i -p "$account")

  case $action in
    "Copy [u]sername")
      local user=$(echo $account | cut -d/ -f2)
      clip $user
      notification "Username copied!"
      ;;
    "Copy pass[w]ord")
      local password=$(pass show $account | head -n 1)
      clip $password
      notification "Password copied!"
      ;;
    "Copy O[T]P")
      local code=$(pass otp code $account)
      clip $code
      notification "One Time Password copied!"
      ;;
  esac
}
