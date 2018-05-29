LEVEL=2

if ! [ -x "$(command -v yamllinter)" ]; then
  echo 'Error: yamllinter is not installed.' >&2
  exit 1
fi

cd "./locale"

RC=0

for r in *.yml
do
  [ "$r" != "validation.yml" ] || continue

  echo "testing $r"
  yamllinter --file "$r" --level $LEVEL
  if [ $? -eq 1 ]
  then
    RC=1
  fi
  echo
done

exit $RC
