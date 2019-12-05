-- | play tic tac toe in console

module Main where

import Data.List
import Model
import Render
import Logic
import Helpers

hasWon :: Board -> Maybe Player
hasWon = undefined

takeTurn :: Game -> Position -> Game
takeTurn = markBoard

startGame :: Int -> Player
startGame boardSize = playGame $ Game (createBoard boardSize) PlayerX

playGame :: Game -> Player
playGame game = getTurn $ Game (getBoard game) nextPlayer
  where nextPlayer = changePlayer $ getTurn game

main :: IO ()
main = do
  putStrLn "Please input size of board."
  boardSize <- getLine
  putStrLn $ drawBoard $ getBoard $ (flip markBoard (Position (1,2))) $ (flip Game PlayerX) $ createBoard $ read boardSize
  --putStrLn $ show $ startGame $ read boardSize

