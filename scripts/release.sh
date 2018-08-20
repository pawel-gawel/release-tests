owner=$(git config remote.origin.url | sed -n 's/.*:\(.*\)\/.*/\1/p') # "pawel-gawel"
user=$owner
repo=$(git config remote.origin.url | sed -n 's/.*\/\(.*\)\.git/\1/p') # "test-utils"
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
    read -p "This will npm version the repo, push the new commit and tag to Github and create
new Github release, based on that tag. Are you sure you want to continue [y/n]? " agreed
    if [ "$agreed" != "y" ]; then
      printf "\n\tbye!\n\n"; exit
    fi
  fi

  tag=$(npm version $1)
  
  git push
  git push --tags

  open https://github.com/${owner}/${repo}/releases/new?tag=$tag
}

list() {
  curl https://api.github.com/repos/${owner}/${repo}/releases
}

create() {
  tag=$1

  read -p "Github 2fa OTP code: " otp

  curl \
    -H "Content-Type: application/json" \
    -H "X-GitHub-OTP: $otp" \
    -i \
    -u $user \
    -d "{ \"tag_name\": \"$tag\" }" \
  https://api.github.com/repos/${owner}/${repo}/releases
}

delete() {
  release_id=$1

  curl \
    -X DELETE \
    -H "X-GitHub-OTP: $otp" \
    -i \
    -u pawel-gawel \
  https://api.github.com/repos/${owner}/${repo}/releases/$release_id
}

run $version