# easy_shell_gpt

Invoke shell-gpt and combine it with thefuck to easily generate and correct shell code.

## Installation

```bash
cp easy_shell_gpt.sh "$HOME/.easy_shell_gpt.sh"
```

Add `source "$HOME/.easy_shell_gpt.sh"` to your `.zshrc` or `.bashrc`.

## Usage

```
~> ? list files in /
ls /
[E]xecute, [D]escribe, [A]bort: e
bin   dev  home  lib    lib64   media  opt   root  sbin  srv  tmp  var
boot  etc  init  lib32  libx32  mnt    proc  run   snap  sys  usr
~> puthon
zsh: command not found: puthon
~> ?                                                                                      127
[*] Invoke thefuck first
python [enter/↑/↓/ctrl+c]
Aborted
[*] thefuck failed, use LLM? [Y/n]Y
python
[E]xecute, [D]escribe, [A]bort: Aborted.
~> 
```