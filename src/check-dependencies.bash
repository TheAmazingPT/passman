function check_dependencies {
  local has_pass has_xclip has_notify_send error_msg

  has_pass=$(which pass)
  has_xclip=$(which xclip)
  has_notify_send=$(which notify-send)

  if [[ -z $has_pass || -z $has_xclip || -z $has_notify_send ]]
  then
    error_msg="Dependencies are missing!"

    echo "$error_msg"
    [[ -n $has_notify_send ]] && notification "$error_msg"

    exit
  fi
}
