function check_cache_file {
  local file_path

  file_path="$1"

  if [ ! -f "$file_path" ]; then
    echo "Creating passman cache"
    mkdir -p "$(dirname "$file_path")"
    touch "$file_path";
  fi
}
