#!/bin/bash

################### FUCTIONS #####################
#######################################
# Check whether the file exist
# Arguments:
#   Path to file
#######################################
function check_if_file_exist
{
  if [ -f "$1" ]; then
    echo "$1 exist"
    return 0
  else
    echo "$1 does not exist"
    return 1
  fi
}

#######################################
# Check whether the line exist in the file
# Arguments:
#   Literal string to check
#   Path to file
#######################################
function check_if_line_exist
{
  if grep -Fxq -- "$1" "$2"; then
      echo "$1 Line(s) found in $2"
      return 0
  else
      echo "$1 Line(s) not found in $2"
      return 1
  fi
}

#######################################
# Appends the line to the file if the line you want to append does not exist
# yet in the file.
# Arguments:
#   String to add
#   Path to file
#######################################
function append_lines_to_file
{
  if check_if_line_exist "$1" "$2"; then
    echo "Not appending \"$1\" in file \"$2\""
    return 0
  else
    echo "$1" >> "$2"
    echo "Appended \"$1\" to the following file \"$2\""
    return 0
  fi
}

SUFILE=/etc/pam.d/su
SUFILE_PAM_WHEEL="auth required pam_wheel.so use_uid"

if check_if_file_exist "$SUFILE"; then
  append_lines_to_file "$SUFILE_PAM_WHEEL" "$SUFILE"
fi

SYSCTL_FILE=/etc/sysctl.conf
SYSCTL_IP_FORWARD="net.ipv4.ip forward = 0"
SYSCTL_CONF_ALL_SEND_REDIRECTS="net.ipv4.conf.all.send redirects = 0"
SYSCTL_CONF_DEFAULT_SEND_REDIRECTS="net.ipv4.conf.default.send redirects = 0"
SYSCTL_CONF_DEFAULT_RP_FILTER="net.ipv4.conf.default.rp_filter = 1"
SYSCTL_CONF_ALL_RP_FILTER="net.ipv4.conf.all.rp_filter = 1"

if check_if_file_exist "$SYSCTL_FILE"; then
  append_lines_to_file "$SYSCTL_IP_FORWARD" "$SYSCTL_FILE"
  append_lines_to_file "$SYSCTL_CONF_ALL_SEND_REDIRECTS" "$SYSCTL_FILE"
  append_lines_to_file "$SYSCTL_CONF_DEFAULT_SEND_REDIRECTS" "$SYSCTL_FILE"
  append_lines_to_file "$SYSCTL_CONF_DEFAULT_RP_FILTER" "$SYSCTL_FILE"
  append_lines_to_file "$SYSCTL_CONF_ALL_RP_FILTER" "$SYSCTL_FILE"
fi


ETC_PROFILE_FILE=/etc/profile
ETC_BASHRC_FILE=/etc/bashrc
ETC_CSH_FILE=/etc/csh.cshrc
ETC_LOGIN_DEFS_FILE=/etc/login.defs
UMASK="umask 077"

if check_if_file_exist "$ETC_PROFILE_FILE"; then
  append_lines_to_file "$UMASK" "$ETC_PROFILE_FILE"
fi

if check_if_file_exist "$ETC_BASHRC_FILE"; then
  append_lines_to_file "$UMASK" "$ETC_BASHRC_FILE"
fi

if check_if_file_exist "$ETC_CSH_FILE"; then
  append_lines_to_file "$UMASK" "$ETC_CSH_FILE"
fi

if check_if_file_exist "$ETC_LOGIN_DEFS_FILE"; then
  append_lines_to_file "$UMASK" "$ETC_LOGIN_DEFS_FILE"
fi




