# Git-Commit-Linter
Bash script to lint git staged files

You can call `linters.sh` this bash file on `.git/hooks/pre-commit`. It will be run when you run `git commit`.

You must install every linter you need by yourself. And add the linter command and file extension on `linter.sh`.

```bash
#adjust to your linter
linter_list=( coffeelint haml-lint rubocop scss-lint )
extension_list=( coffee haml rb scss )
```
