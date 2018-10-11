function get_password_list {
  typeit=0

  if [[ $1 == "--type" ]]; then
    typeit=1
    shift
  fi

  prefix=${PASSWORD_STORE_DIR-~/.password-store}
  password_files=( "$prefix"/**/*.gpg )
  password_files=( "${password_files[@]#"$prefix"/}" )
  password_files=( "${password_files[@]%.gpg}" )

  #echo ${password_files[@]}

  printf -v list "%s " "${password_files[@]}"
  echo $list
}
