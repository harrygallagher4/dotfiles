# new-executable
function nex {
  if [ ! -f "$1" ]; then
    touch "$1";
    chmod +x "$1";
    vim "$1";
  fi
}

