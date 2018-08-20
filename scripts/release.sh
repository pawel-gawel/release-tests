owner=$(git config remote.origin.url | sed -n 's/.*:\(.*\)\/.*/\1/p')
repo=$(git config remote.origin.url | sed -n 's/.*\/\(.*\)\.git/\1/p')
version=$1

while getopts ":hvf" o; do
  case "${o}" in
    h)
      usage
      ;;
    v)
      set -x
      ;;
    f)
      force=true
      ;;
    \?)
      printf "\n\tInvalid option: -$OPTARG\n\n" >&2; usage
      ;;
  esac
done
shift $((OPTIND-1))

run() {
  if [ -z $force ]; then
    printf "\n"
    read -p "This will npm version the repo, push the new commit and tag to Github and then go to new release page.

Are you sure you want to continue [y/n]? " agreed
    if [ "$agreed" != "y" ]; then
      printf "\n\tbye!\n\n"; exit
    fi
  fi

  tag=$(npm version $1)
  
  git push
  git push --tags

  open https://github.com/${owner}/${repo}/releases/new?tag=$tag
}

run $version