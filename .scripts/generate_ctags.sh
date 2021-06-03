if [ $# -eq 0 ]; then
  echo "Provide project name to generate ctags in. this MUST contain a '.git' directory"
  exit 1
fi

if [ -f "$1/.git/tags.pid" ]; then
  (>%2 echo "Previous ctags generate execution still running. Exciting without action")
  exit 1
fi

echo $$ > $1/.git/tags.pid

( cd $1 && ctags -R --tag-relative --languages=python --exclude=.git --exclude=logs --exclude=virtualenv_run --exclude=node_modules --exclude=docker-venv --exclude=venv --exclude=.* -f .git/tags )

rm $1/.git/tags.pid
