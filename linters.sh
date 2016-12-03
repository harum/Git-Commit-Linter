# run_linters.sh
linter_list=( coffeelint haml-lint rubocop scss-lint )
extension_list=( coffee haml rb scss )
index_length=`expr ${#linter_list[@]} - 1`
error_lint_count=0

for index in `seq 0 $index_length`; do
  file_ext="\.(""${extension_list[$index]}"")(\..+)?$"
  diff_list=`git diff --cached --name-only | grep -E $file_ext`
  linter=${linter_list[$index]}

  for diff in $diff_list; do
    $linter $diff
    if [ $? -eq 1 ]; then
      let error_lint_count="$error_lint_count + 1"
    fi
  done
done

if [ $error_lint_count -gt 0 ]; then
  exit 1
else
  echo "No Error Found"
fi
