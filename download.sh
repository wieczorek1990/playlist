#!/bin/bash
rm -rf tmp
mkdir tmp
cd tmp
sed 's/\t/;/g' ../wieczorek1990_lovedtracks.tsv | cut -d ';' -f 1 | tail -n +2 > lastfm
cat ../starred.txt | tr ' ' '\n' > spotify_uri
while read line
do
  if [[ $line == spotify:track:* ]]
  then
    id=`echo $line | cut -d ':' -f 3`
    title=`curl -s -X GET "https://api.spotify.com/v1/tracks/$id" | jq -r '.name'`
  else
    title=`echo $line | cut -d ':' -f 5 | python -c "import urllib, sys; print urllib.unquote_plus(sys.stdin.read())"`
  fi
  echo $title >> spotify
done < spotify_uri
rm spotify_uri
sort lastfm -o lastfm
sort spotify -o spotify
