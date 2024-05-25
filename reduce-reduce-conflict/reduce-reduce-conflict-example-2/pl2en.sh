
cat parser.output | sed 's/Stan/State/g'| sed 's/redukcja przy użyciu reguły/reduction with rule/g'  |sed 's/konflikty/conflicts/g' | sed 's/Symbole nieterminalne/Non-terminal symbols/g' | sed 's/Symbole terminalne/Terminal symbols/g' | sed 's/i reguły, w których występują/and rules they occur in/g' | sed 's/przesunięcie, i przejście do stanu/shift and go to state/g' | sed 's/$domyślnie/$default/g' | sed 's/akceptowanie/accept/g' | sed 's/przejście do stanu/go to state/g'| sed 's/Symbole/Symbols/g'| sed 's/przesunięcie/shift/g' | sed 's/redukcja/reduce/g' | sed 's/Gramatyka/Grammar/g' | sed 's/Bezużyteczne reguły w analizatorze z powodu konfliktów/Useless rules due to conflicts/g'  > temp

cat temp > parser.output
rm temp

# | sed 's///g' | sed 's///g' | sed 's///g' | sed 's///g'  |  
