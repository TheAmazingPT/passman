function get_password_list {
  local prefix password_files

  prefix=${PASSWORD_STORE_DIR-~/.password-store}

  password_files=( "$prefix"/**/*.gpg )
  password_files=( "${password_files[@]#"$prefix"/}" )
  password_files=( "${password_files[@]%.gpg}" )

  echo "${password_files[@]}"
}
