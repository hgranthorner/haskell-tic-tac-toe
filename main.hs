-- | play tic tac toe in console

module Main where

import Data.List
import Model
import Render

createBoard :: Int -> Board
createBoard boardSize = Board boardSize [Mark (Position (x, y)) Empty | x <- [1..boardSize], y <- [1..boardSize]]

changePlayer :: Player -> Player
changePlayer player
  | player == PlayerX = PlayerO
  | player == PlayerO = PlayerX
  | otherwise = PlayerX

hasWon :: Board -> Maybe Player
hasWon = undefined

markBoard :: Mark -> Position -> Board -> Board
markBoard mark posn gameBoard = undefined

takeTurn :: Game -> Position -> Game
takeTurn = undefined

startGame :: Int -> Player
startGame boardSize = playGame $ Game (createBoard boardSize) PlayerX

playGame :: Game -> Player
playGame game = turn $ Game (board game) nextPlayer
  where nextPlayer = changePlayer $ turn game

main :: IO ()
main = do
  putStrLn "Please input size of board."
  boardSize <- getLine
  putStrLn $ show $ startGame $ read boardSize

