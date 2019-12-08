-- | set up logic for marking and winning the game
module Logic where

import Data.List
import Control.Applicative
import Data.Maybe

import Helpers
import Model

markBoard :: Game -> Position -> Game
markBoard (Game board player) posn = Game newBoard (changePlayer player)
  where
    mark =
      case player of
        PlayerX -> X
        PlayerO -> O
    size = getSize board
    index = indexFromPosn posn (getSize board)
    boardState = getCurrentState board
    newBoard = Board size $ swapIn boardState index (Mark posn mark)

validateMove :: Board -> Position -> Bool
validateMove board posn
  | (getMarkType $ state !! index) == Empty = True
  | otherwise = False
  where
    index = indexFromPosn posn (getSize board)
    state = getCurrentState board

anyWinner :: Board -> Bool
anyWinner board = undefined
  where rows = groupRow board
        cols = groupCol board

-- Need to loop through groupRow and groupCol, find any array that all has the same mark, return that mark type
-- find (allEq . map (getMarkType)) $ filter (\x -> Empty /= getMarkType $ head x) $ groupRow x
-- Then, ask if it returned Nothing
-- or if the returned list is full of "Empty"
determineWinner :: Board -> Maybe MarkType
determineWinner board
  | isJust maybeList = (getMarkType . head) <$> maybeList
  | otherwise        = Nothing
  where pred elem = (allEq $ map (getMarkType) elem) && ((/= Empty) $ getMarkType $ head elem)
        maybeList = (find (pred) $ groupRow board) <|> (find (pred) $ groupCol board)
