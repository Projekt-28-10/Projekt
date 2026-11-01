#!/bin/bash
# run.sh — uruchamia sito w Javie
cd "$(dirname "$0")"
javac Sito.java 2>/dev/null
java Sito
read -p "Naciśnij Enter, aby zamknąć..."
