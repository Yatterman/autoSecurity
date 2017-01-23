#!/bin/bash

#modifica questo valore per controllare a che altezza iniziano i pulsanti delle varie sezioni
starty=125

#modifica questo valore per controllare a che altezza finiscono i pulsanti delle varie sezioni
endy=730

choice=""
endloop="n"
block=0
firstloop=1


while [[ $choice != $endloop ]]
do
	#muove il mouse sul pulsante avanti
	xdotool mousemove 920 690

	#per qualche ragione, sto cazzo di flash non risponde al primo click, quindi ne mandiamo due
	xdotool sleep 0.2
	xdotool click 1
	xdotool sleep 0.2
	xdotool click 1


	#da qui inizia il click sulle varie sezioni
	if [[ $firstloop != 1 ]]; then

		if [[ "$choice" != "" ]]; then
			block=$choice
		fi

	fi

	for (( y = $starty+20*$block ; y < $endy ; y += 20 ))
	do
		xdotool mousemove 100 $y
		xdotool sleep 0.1
		xdotool click 1

	done

	#muove il mouse sulla parte vuota della barra di scorrimento orizzontale e fa click
	#in questo modo rimette la slide nella parte visibile dello schermo se viene caricata spostata
	xdotool mousemove 1220 730
	xdotool sleep 0.2
	xdotool click 1

	#aspetta 30 secondi
	#si puo' saltare il tempo di attesa inserendo un numero che indica la sezione che vogliamo portare avanti
	echo "Continue?"

	read -t 30 choice

	firstloop=0

done
