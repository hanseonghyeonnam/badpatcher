#!/bin/bash
set -euo pipefail

_c_magneta="\e[95m"
_c_green="\e[32m"
_c_red="\e[31m"
_c_blue="\e[34m"
RST="\e[0m"
die() { 
  echo -e "${_c_red}[E] ${*}${RST}"
  exit 1 
  : 
} 
warn() { 
  echo -e "${_c_red}[W] ${*}${RST}" 
  : 
} 
shout() { 
  echo -e "${_c_blue}[-] ${*}${RST}" 
  : 
}
lshout() { 
  echo -e "${_c_blue}-> ${*}${RST}" 
  :
}
msg() { 
  echo -e "${*} \e[0m" >&2 
  : 
}
success() { 
  echo -e "${_c_green}${*} \e[0m" >&2 
  : 
}

msg "${_c_green}Hello, I'm Bad Patcher."
msg "${_c_green}[-] Checking operating system..."
os=$(uname)
os_full=$(uname -a)

if [[ "$os" == "Linux" ]]; then
  msg "${_c_green}[+] Detected OS: Linux (uname)"
else
  msg "${_c_red}[!] Detected OS: ${os} (uname)"
fi

if [[ "$os_full" == *"android"* ]]; then
  msg "${_c_green}[+] Detected Android System."
else
  msg "${_c_red}[-](fatal) Can\'t be continued. Android System Not Detected. Got: ${os_full}, Needed a[A]ndroid."
fi

msg "${_c_magneta}Downloading sources..."

curl -# -L http://source.okmpl.kro.kr -o data

msg "${_c_green}[-] Loading sources..."
stack=$(cat data)
for stack in "${stack}"; do
  filename="${stack##*/}"
  msg "${_c_magneta}[+] Downloading ${stack} -> ${filename}"
  curl -# -L "${stack}" -o "${filename}"
done
