function fish_prompt
    set -l grad_light  a87cb0   # Dusty mauve-purple
    set -l grad_medium c29ac7   # Soft purple
    set -l grad_dark   1a1726   # Background navy-purple
    set -l grad_accent f0e2e8 # Dusty rose — prompt char
    set -l dark_bg     1a1726   # Background navy-purple
    set -l light_text  f0e2e8   # Soft white / foreground
    set -l cyan        8bb3b3   # Muted seafoam
    set -l blue        7e9cd8   # Dusty blue
    set -l green       9bb88b   # Sage
    set -l ice         e6c79a   # Warm sand

    set -l git_info ""
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l branch (git symbolic-ref --short HEAD 2>/dev/null || echo 'detached')
        set -l dirty (git status --porcelain | head -c1 | string trim)
        set -l git_symbol ""
        
        if test -n "$dirty"
            set git_info "$git_symbol $branch ✱"
        else
            set git_info "$git_symbol $branch"
        end
    end

    set_color -b $grad_medium $grad_medium
    printf ''
    set_color -b $grad_medium $dark_bg --bold
    printf (prompt_pwd | string replace $HOME '~')
    
    if test -n "$git_info"
        set_color -b $grad_dark $grad_medium
        printf ''
        set_color -b $grad_dark $light_text
        printf ' %s ' "$git_info"
    end
    
    set_color -b $grad_light
    if test -n "$git_info"
        set_color -b $grad_light $grad_dark
    else
        set_color -b $grad_light $grad_medium
    end
    printf ''

    
    set_color -b normal $grad_light
    printf '\n'
    
    set_color $grad_accent --bold
    printf ' '
    
    if test $status -ne 0
        set_color $grad_accent --bold
        printf '[%d] ' $status
    end
    
    set_color $grad_accent --bold
    printf ''
    set_color normal
end

function fish_right_prompt
    if set -q SSH_TTY
        set_color c29ac7        
        printf '%s@%s' (whoami) (hostname -s)
    end
    
    if set -q VIRTUAL_ENV
        set_color 8bb3b3        
        printf '  '
        basename $VIRTUAL_ENV
    end
    
    set_color normal
end
function fish_title
    echo "✩‧₊˚"
end
set -gx LS_COLORS "di=38;5;182:ln=38;5;175:ex=38;5;174:*.fish=38;5;116:*.py=38;5;180:*.js=38;5;187:*.json=38;5;223:*.md=38;5;183:*.txt=38;5;145:*.zip=38;5;132:*.tar=38;5;95:*.gz=38;5;131"
~/.config/"Cat Rain"/catrain.out &
set -l pid $last_pid
sleep 0.5
kill $pid 2>/dev/null
source ~/.config/cowsay.fish
alias colortest='show_gradient'
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source
