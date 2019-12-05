-- | set up logic for marking and winning the game
module Logic where

import Model
import Helpers


markBoard :: Game -> Position -> Game
markBoard (Game board player) posn = Game newBoard (changePlayer player)
  where mark = case player of
          PlayerX -> X
          PlayerO -> O
        size = getSize board
        index = indexFromPosn posn (getSize board)
        boardState = getCurrentState board
        newBoard = Board size $ swapIn boardState index (Mark posn mark)

