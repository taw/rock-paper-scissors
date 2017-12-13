GET /
  Hello, let's start a game
GET /names
  [NAME1] [NAME2]
POST /names-chosen
  redirect /choice1
GET /choice1
  [ROCK] [PAPER] [SCISSORS]
POST /chosen1
  redirect /choice2
GET /choice2
  [ROCK] [PAPER] [SCISSORS]
POST /choice2
  redirect /results
GET /results
  The winner is NAME


<a href="/single_player_name"><button>Single Player</button></a>
<a href="/multiplayer_player_names"><button>Multiplayer</button></a>

