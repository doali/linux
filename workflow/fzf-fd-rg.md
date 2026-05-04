# Installation de fzf, fd et ripgrep (rg)

Outils indispensables pour la recherche rapide de fichiers et de texte,
très utilisés avec Git, Doom Emacs, Vim, etc.

---

## ✅ Ubuntu / Debian

### Installation

```bash
sudo apt update
sudo apt install -y fzf fd-find ripgrep
```

### Noms des commandes

- fzf       → fzf
- ripgrep   → rg
- fd        → fdfind (nom renommé sous Ubuntu)

### Alias recommandé pour fd

```bash
ln -s $(command -v fdfind) ~/.local/bin/fd
```

ou

```bash
alias fd=fdfind
```

### Vérification

```bash
fzf --version
rg --version
fd --version
```

---

## ✅ CentOS / AlmaLinux / Rocky (RHEL-like)

### 1️⃣ Activer le dépôt EPEL

```bash
sudo dnf install -y epel-release
sudo dnf update
```

### 2️⃣ Installation

```bash
sudo dnf install -y fzf fd-find ripgrep
```

### Noms des commandes

- fzf       → fzf
- ripgrep   → rg
- fd        → fdfind

### Alias recommandé pour fd

```bash
ln -s $(command -v fdfind) ~/.local/bin/fd
```

ou

```bash
alias fd=fdfind
```

### Vérification

```bash
fzf --version
rg --version
fd --version
```

---

## ✅ Configuration conseillée (fzf + fd)

Dans ~/.bashrc ou ~/.zshrc :

```bash
export FZF_DEFAULT_COMMAND='fd --type f'
```

Alternative avec ripgrep :

```bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
```

---

## ✅ Résumé rapide

AlmaLinux  : dnf install epel-release
             dnf install fzf fd-find ripgrep
fd         : alias fd=fdfind# Document Title

