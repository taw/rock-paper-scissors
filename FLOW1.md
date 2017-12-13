GET /
  Hello, let's start a game
GET /choice1
  [NAME]
  [ROCK] [PAPER] [SCISSORS]
POST /chosen1
  redirect /choice2
GET /choice2
  [NAME]
  [ROCK] [PAPER] [SCISSORS]
POST /chosen2
  redirect /results
GET /results
  The winner is NAME

(you can skip redirect to GET and display next stage from POST)
