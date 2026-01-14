# GUIDE D'INSTALLATION STARSHIP : LOOK DOOM EMACS

## 1. INSTALLATION DE LA POLICE (HACK NERD FONT)
> Nécessaire pour l'affichage du logo AlmaLinux et des icônes Git/Python.

1. Installer sur Linux :
  - `mkdir -p ~/.local/share/fonts`
  - `cd /tmp`
  - `wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip`
  - `unzip Hack.zip -d ~/.local/share/fonts/HackNerd`
  - `fc-cache -fv`
2. Appliquer dans Tilix :
  - Préférences > Profils > Par défaut > Apparence.
  - Sélectionner : Hack Nerd Font Mono Regular.

---

## 2. INSTALLATION DE STARSHIP
1. Binaire :
  - `curl -sS https://starship.rs/install.sh | sh`
2. Activation Bash :
  - > Ajouter à la fin de votre ~/.bashrc : \
    `eval "eval -- "$(/usr/local/bin/starship init bash --print-full-init)""`

    ou bien `eval "$(starship init bash)"`
3. Recharger : `source ~/.bashrc`

---

## 3. FICHIER DE CONFIGURATION (DOOM ONE)
Copier ce bloc exactement dans ~/.config/starship.toml :

```toml
# Augmente le délai pour éviter les messages [WARN]
scan_timeout = 100

format = """
[ \\( ](bold #3f444a)\
$os\
$username\
$directory\
$git_branch\
$git_status\
$python\
[ \\) ](bold #3f444a)
$character"""

[os]
disabled = false
style = "bold #51afef"
format = "[$symbol]($style)"

[os.symbols]
AlmaLinux = " "

[username]
show_always = true
style_user = "bold #51afef"
format = "[$user]($style)"

[directory]
style = "bold #c678dd"
format = " [in ](white)[$path]($style)"
truncation_length = 3

[git_branch]
symbol = " "
style = "bold #98be65"
format = " [on ](white)[$symbol$branch]($style)"

[git_status]
style = "bold #ff6c6b"
format = "([$all_status$ahead_behind]($style))"

[python]
symbol = "🐍 "
style = "bold #da8548"
format = " [via ](white)[$symbol$virtualenv]($style)"

[character]
success_symbol = "[ ❯](bold #51afef)"
error_symbol = "[ ❯](bold #ff6c6b)"
```

---

## 4. PRESETS ALTERNATIFS (ÉCRASE LA CONFIG)
Pour changer radicalement de style, exécuter l'une de ces commandes :

|style|commande|
|---------|---------|
| Tokyo Night | `starship preset tokyo-night -o ~/.config/starship.toml` |
| Pastel Powerline | `starship preset pastel-powerline -o ~/.config/starship.toml` |
| Pure | `starship preset pure-preset -o ~/.config/starship.toml` |
| Gruvbox Rainbow | `starship preset gruvbox-rainbow -o ~/.config/starship.toml` |
| Bracketed segments | `starship preset bracketed-segments -o ~/.config/starship.toml` |

---

## 5. DÉPANNAGE
- Symboles cassés : Vérifiez que vous utilisez bien la version "Mono" de Hack Nerd Font dans Tilix.
- Parenthèses invisibles : Vérifiez que les `\(` et `\)` possèdent bien deux barres obliques dans votre fichier .toml.
- Timeout : Si l'erreur de scan persiste, passez `scan_timeout à 500`.
