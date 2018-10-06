#!/bin/bash

FUNCTION="Manage Applications"

# ---------
# Variables
# ---------

source /opt/GooPlex/menus/variables.sh
clear

# ------------
# Menu Options
# ------------

# Rclone
RCLONE(){
  /opt/GooPlex/menus/appsmedia/rclone.sh
}

# Plex
PLEX(){
  /opt/GooPlex/install/apps/plex.sh
}

# Tautulli
TAUTULLI(){
  /opt/GooPlex/install/apps/tautulli.sh
}

# Emby
EMBY(){
  /opt/GooPlex/install/apps/emby.sh
}

# Exit
QUIT(){
  exit
}

# ------------
# Display menu
# ------------

show_menus() {
  clear
  echo -e " ${LPURPLE}"
  echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo -e " G O O P L E X - Visit techperplexed.ga "
  echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo -e " $FUNCTION "
  echo -e " ${STD}"
  echo -e " ${LPURPLE}A${STD} - Rclone"
  echo -e " ${LPURPLE}B${STD} - Plex"
  echo -e " ${LPURPLE}C${STD} - Tautulli"
  echo -e " ${LPURPLE}D${STD} - Emby"
  echo -e " ${WHITE}Z${STD} - EXIT to Main Menu"
  echo -e " ${LPURPLE}"
  echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo -e " ${STD}"
}

# ------------
# Read Choices
# ------------

read_options(){
  local choice
    read -p "Choose option: " choice
    case $choice in
      [Aa]) RCLONE ;;
      [Bb]) PLEX ;;
      [Cc]) TAUTULLI ;;
      [Dd]) EMBY ;;      
      [Zz]) QUIT ;;
      *) echo -e "${LRED}Please select a valid option${STD}" && sleep 2
    esac
}
 
# ----------
# Finalizing
# ----------

trap '' SIGINT SIGQUIT SIGTSTP

while true
do 
  show_menus
  read_options
done