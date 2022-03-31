directory=$1

function renameFile()
{
  fileName=$1

  echo fileName
}

if [[ -f $directory ]]; then
  echo "No such directory found: $directory"
  exit 1
else
  cd $directory
fi

find . -maxdepth 1 -regextype posix-extended -type f -regex '.*.(jpg|JPG)$' | while read fileEntry; do
  fileBirthDate=$(stat -c "%w" "$fileEntry" | awk '{print $1}')
  oldFileName=$(echo $fileEntry | sed -E 's/^\.\/(.*)\.(jpg|JPG)/\1/')
  newFileName="$fileBirthDate.$oldFileName"

  mv --backup=t $fileEntry "$newFileName.jpg"
done

find . -maxdepth 1 -name '*.jpg'