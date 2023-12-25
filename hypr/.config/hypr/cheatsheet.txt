# Hyprland CheatSheet #

  Super = Windows Key
  $term = alacritty

# common operations
  Super          Return   *term* (`alacritty`)
  Super          t        *term* (`kitty`)
  Super          q        *quit* (kill focused window)
  Super   Shift  q        *quit* (kill focused window)
  Super          d        *show app menu* (`wofi small`)
  Super   Shift  d        *show app menu* (`wofi large`)
  Super          x        *show archlinux-logout* (lock/suspend/logout/reboot/shutdown)
  Super   Shift  r        *reload config files* (`hyprland reload`)
  Super          Escape   *kill application*

# screenshot
  PrintSrc                *full screenshot*
  Shift  PrintSrc         *active window screenshot*
  Ctrl   PrintSrc         *full screenshot + timer*

# application shortcuts
  Ctrl    Alt U           *pavucontrol*
  Ctrl    ALT P           *pamac-manager*
  Ctrl    Alt B           *browser* (`firefox`)
  Ctrl    Alt S           *music player* (`ncmpcpp`)
  CTRL    ALT A           xfce4-appfinder
  CTRL    ALT C           catfish
  CTRL    ALT F           $files
  CTRL    ALT E           archlinux-tweak-tool
  CTRL    ALT B           firefox
  CTRL    ALT G           chromium -no-default-browser-check
  CTRL    ALT I           nitrogen
  CTRL    ALT K           $scriptsDir/lockscreen
  CTRL    ALT L           $scriptsDir/lockscreen
  CTRL    ALT NEXT        conky-rotate -n
  CTRL    ALT P           pamac-manager
  CTRL    ALT PREVIOUS    conky-rotate -p
  CTRL    ALT R           rofi-theme-selector
  CTRL    ALT Return      foot
  CTRL    ALT S           $music
  CTRL    ALT T           $term
  CTRL    ALT U           pavucontrol
  CTRL    ALT V           vivaldi-stable
  CTRL    ALT W           arcolinux-welcome-app
  CTRL    SHIFT  Escape    $term --class bashtop -T bashtop -e bashtop
  Super   Shift  Return   *file manager* (`thunar`)
  Super   F1              *browser* (`firefox`)

# Resize
  Super   SHIFT  H        resizeactive,-50 0
  Super   SHIFT  L        resizeactive,50 0
  Super   SHIFT  K        resizeactive,0 -50
  Super   SHIFT  J        resizeactive,0 50

# Move
  Super   CTRL   H        movewindow, l
  Super   CTRL   L        movewindow, r
  Super   CTRL   K        movewindow, u
  Super   CTRL   J        movewindow, d

# container layout
 
  Super   Shift   Space       *toggle tiling/floating mode*
  Super   left mouse button   *move window*
  Super   right mouse button  *resize window*

# workspaces
  Super         1 .. 0    *switch to workspace 1 .. 10*
  Super  Shift  1 .. 0    *move container to workspace 1 .. 10*

# notes
  - *Hyprland* configuration files are in `~/.config/hypr/`.
    Read all the files with the editor of your choice.
    More keybindings are included in the config.
  - *Waybar* is documented through man pages - `man waybar`. 
  - *Wofi* is documented through man pages - `man wofi`.
  - *Multimedia keys* - may not work for every keyboard
    may need to hold down the function (`fn`) key
  - Follow the wiki - https://wiki.hyprland.org/
  - Follow the github - https://github.com/hyprwm/Hyprland

# user githubs
  - https://github.com/eldermf/bspwm-hyprland
  - https://github.com/lauroro/hyprland-dotfiles
  - https://github.com/eneshecan/dotfiles

# share your own files on github 
  - so we can all learn
  - and you have a backup
