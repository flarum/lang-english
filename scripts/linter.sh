LEVEL=2

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if ! [ -x "$(command -v yamllinter)" ]; then
  echo 'Error: yamllinter is not installed.' >&2
  exit 1
fi

cd "./locale"

RC=0

for r in *.yml
do
  [ "$r" != "validation.yml" ] || continue

  echo "checking $r:"

  yamllinter --file "$r" --level $LEVEL

  if [ $? -eq 1 ]; then
    RC=1
    printf "${RED}⨉ $r faild${NC}\n"
  else
    printf "${GREEN}✓ $r passed${NC}\n"
  fi

  echo
done

exit $RC
