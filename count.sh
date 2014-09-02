#!/bin/bash
lastfm=`cat wieczorek1990_lovedtracks.tsv | tail -n +2 | wc -l`
spotify=`cat starred.txt | tr ' ' '\n' | wc -l`
echo "You have $lastfm last.fm tracks and $spotify Spotify tracks"
