clear

set effects \
  "cowsay -f moose 'Mooooose!' | lolcat" \
  "cowsay 'Moo!! I''m colourful!' | lolcat"

set idx (random 1 (count $effects))
eval $effects[$idx]






