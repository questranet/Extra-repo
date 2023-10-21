requests=$1

 curl https://random-word-api.herokuapp.com/word?number=10 -o /tmp/words
 cat /tmp/words