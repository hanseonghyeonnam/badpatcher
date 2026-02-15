#!/bin/bash
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
F=0

msg "${_c_magneta}Enter Auth port ( Port show in option enter six digit number): "
read -r authport
msg "${_c_magneta}Enter Auth pincode: "
read -r authpincode
msg "${_c_magneta}Enter debug port: "
read -r debugport
