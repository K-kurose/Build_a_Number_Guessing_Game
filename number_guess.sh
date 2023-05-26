#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER

echo "Enter your username:"
read USERNAME

USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM records WHERE username='$USERNAME'")

if [[ $USER_INFO ]]
then
  IFS="|" read USERNAME GAMES_PLAYED BEST_GAME <<< $USER_INFO
  GAMES_PLAYED=$(($GAMES_PLAYED + 0))
  BEST_GAME=$(($BEST_GAME + 0))
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read ANSWER
COUNTER=1

while [ "$ANSWER" != "$RANDOM_NUMBER" ]
do
  let COUNTER++

  if [[ ! $ANSWER =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read ANSWER
  else
    if [ $ANSWER -lt $RANDOM_NUMBER ]
    then
      echo -e "\nIt's higher than that, guess again:"
      read ANSWER
    elif [ $ANSWER -gt $RANDOM_NUMBER ]
    then
      echo -e "\nIt's lower than that, guess again:"
      read ANSWER
    fi
  fi
done

let GAMES_PLAYED++

if [ $GAMES_PLAYED -eq 1 ]
then
  ADD_NEWUSER=$($PSQL "INSERT INTO records(username, games_played, best_game) VALUES ('$USERNAME', $GAMES_PLAYED, $COUNTER) ")
else
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE records SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME' ")
  if [ $COUNTER -lt $BEST_GAME ]
  then
    UPDATE_BEST_GAMES=$($PSQL "UPDATE records SET best_game = $COUNTER WHERE username = '$USERNAME' ")
  fi
fi

echo -e "\nYou guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"
