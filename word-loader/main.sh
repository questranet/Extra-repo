requests=$1

 curl "https://random-word-api.herokuapp.com/word?number=$requests" -o /tmp/words
 cat /tmp/words