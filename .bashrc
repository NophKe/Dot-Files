#/bin/bash
[[ $- != *i* ]] && return
#

/bin/setleds -D num 2>/dev/null
/bin/numlockx 2>/dev/null

alias pphp='cd /home/nono/fundamentals/export/ && /opt/lampp/bin/php -S localhost:8000'
alias ls='ls --color=auto'
alias vi='vim'
alias i3='startx /bin/i3'
alias gnome='startx /bin/gnome-session'

PS1='[\u@\h \W]\$ '


YdefautPTS="/dev/pts/*"
YdefautPTS_action="zsh"

YdefautTTY="/dev/tty*"
YdefautTTY_action="zsh"

YconsoleCourante=`tty`


function YasciiArt {
	tput setab 0 
	tput setaf 4 
	tput bold
	
	tput clear

	echo
	echo
	echo "                                        PPPPPPPPPPPPPPPPP."
	echo "                                        P=================P"
	echo "                                        P=====ppppppp======P"
	echo "                                        °PP===p     p=======P"
	echo "                                          P===p     p=======P"
	echo "                                          P===p     p=======P"
	echo "   NNN                                    P===PPPPPPP======P  HHHHHHH   HHHHHH    kkkkk       kkkk         3333333333333333"
	echo "   NNNN     NNNNNNNNNNNNNNN_________      P==============PP     hh        hh      kkkk     kkkk                      333333"
	echo "   NNN NN     NNN         /OOOOOOOOOO.    P=====pPPPPPPPP       hh        hh      kkkk   kkkk                       333333 "
	echo "   NNN  NN    NNN         OO        |O    P=====P               hh        hh       KKKKKKK                    333333       "  
	echo "   NNN   NN   NNN         OO        |O    P=====P               hh        hh      kkkkKKKKK                       3333333  "
	echo "   NNN    NN  NNN         OO        |O    P=====P               HhhhhhhhhhHh      kkkk  KKK                           33333"
	echo "   NNN     NN NNN         OO        |O  pP======Pp              hh        hh      kkkk    kk                           3333" 
	echo "   NNN      NNNNN         OO        |O  P========P              hh        hh      kkkk     kk                         33333"
	echo "   NNN       NNNN         OO        |O  P========P              hh        hh      kkkk      kk            333         3333 "
	echo "   NNN        NNN         °oooooooooo/  PPPPPPPPPP           HHHHHH    HHHHHHH    kkkk       kkkkkkkk      3333333333333" 
	echo
	echo
	
	tput sgr0
}


function Yinit {
	YasciiArt
	Ybienvenue
	exec $1
}



function Ybienvenue {
	tput setaf 2
	tput bold

	echo "Nous sommes le $(date +"%A %d %B")."
	echo
	echo " TERMINAL UTILISé :" $YconsoleCourante
	echo
	echo "Il est actuelement : $(date +"%H heures et %M minutes.")"	
	echo
	
	tput sgr0
}
	
	
function YsuRoot {
	Yinit
	echo " o ou O pour Oui, y ou Y pour Yes ..."
	echo 
	read -t 5 -n 1 -p " Voulez-vous devenir Root ?" CHOISI || CHOISI="sans reponse"
	
	case $CHOISI in 
		'o' | 'O' | 'y' | 'Y' )		Yinit "su root" 	;;
		* )				Yinit "zsh"		;;
	esac
}



function Ywarning {
		YasciiArt
		Ybienvenue
		
		tput setaf 3
		tput bold
		tput blink

		echo "TAPEZ   \" gnome \" pour démarrer un environnement graphique !" 
		echo
		
		tput sgr0
		
		exec zsh
}


function Ymenu {
	YasciiArt
	echo "		++++++++++++++++++++++++++++++++++++"
	echo "		+ CHOISIR ENVIRONNEMENT A DEMARRER +"
	echo "		++++++++++++++++++++++++++++++++++++"
	echo
	echo " 1- Démarrer i3 Window Manager"
	echo
	echo " 2- Démarrer Z-Shell"
	echo 
	echo " 3- Démarrer Gnome Shell        <--- Recommandé si tu te sens perdu !!!"
	echo 
	echo " 4- Login as root"
	echo
	echo " 5- Démarrer Bash"
	echo 
	
	tput bold
	
	echo " Tu as cinq secondes pour choisir..."
	echo
	
	read -t 5 -n 1 -p " Quel est ton choix? " CHOISI || CHOISI="sans_reponse"

	case $CHOISI in
	
		1 | '&' )			Yinit "startx /bin/i3"			;;
		2 | 'é' )			Yinit "zsh" 				;;
		3 | '"' )			Yinit "startx /bin/gnome-session" 	;;
		4 | "\'") 			Yinit "su root"				;;
		5 | "\(" )			Yinit 					;;
	#	6 | '-' )							;;
	#	7 | è )			 					;;
		"sans_reponse" )		Ywarning				;; 
		* )				Yinit "zsh"				;;
	esac
}


case $YconsoleCourante in
	
	'/dev/tty1' )			Yinit "startx /bin/i3"		;;
	'/dev/tty2' )			Ymenu				;;
	'/dev/pts/0' )			YsuRoot				;;
	$YdefautPTS )			Yinit "zsh"			;;
	$YdefautTTY )			Ymenu 				;;
esac
