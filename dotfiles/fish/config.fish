if status is-interactive
    fish_add_path ~/.local/bin ~/.claude/bin
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # pnpm
    set -gx PNPM_HOME "$HOME/.local/share/pnpm"
    fish_add_path $PNPM_HOME

    # Better ls
	# Better defaults
	alias ls='eza --icons --group-directories-first -1'
	alias cat='bat --style=auto'
	alias find='fd'
	alias grep='rg'
	alias du='dust'
	alias df='duf'
	alias top='btop'
	alias tree='eza --tree --icons'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gspu 'git stash push'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'
    abbr gf 'git fetch'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    abbr nr 'npm run'
    abbr ni 'npm install'
    abbr nrd 'npm run dev'
    abbr nrs 'npm run start'
    abbr nrb 'npm run build' 
    abbr pn 'pnpm run'
    abbr pi 'pnpm install'
    abbr pu 'pnpm uninstall'
    abbr prd 'pnpm run dev'
    abbr prs 'pnpm run start'
    abbr prb 'pnpm run build'
    abbr dc 'docker compose'
    abbr dcu 'docker compose up -d'
    abbr dcub 'docker compose up --build -d'
    abbr dcd 'docker compose down'
    abbr dcl 'docker compose logs -f'
    abbr cr 'cargo run'

    abbr claude 'export ANTHROPIC_BASE_URL="http://185.193.127.242/anthropic"
export ANTHROPIC_MODEL="claude-opus-latest"
export ANTHROPIC_DEFAULT_OPUS_MODEL="claude-opus-latest"
export ANTHROPIC_DEFAULT_SONNET_MODEL="claude-sonnet-4-6"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="claude-haiku-4-5"
export CLAUDE_CODE_SUBAGENT_MODEL="claude-sonnet-4-6"
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="0" claude'

    alias von='sudo systemctl start sing-box'
    alias voff='sudo systemctl stop sing-box'
    alias vst='sudo systemctl status sing-box'

    # Custom colours
    if test "$TERM_PROGRAM" != "vscode"
        command cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
    end

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
    
    # Custom fish config
    function nv
        neovide --fork --cwd (pwd) $argv
    end

    function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end


