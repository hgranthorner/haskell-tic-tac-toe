-- | play tic tac toe in console
module Main where

import Data.List
import Helpers
import Logic
import Model
import Render

hasWon :: Board -> Maybe Player
hasWon = undefined

takeTurn :: Game -> Position -> Game
takeTurn = markBoard

startGame :: Int -> Player
startGame boardSize = playGame $ Game (createBoard boardSize) PlayerX

playGame :: Game -> Player
playGame game = undefined

gameLoop :: Int -> Game -> IO Game
gameLoop count game
  | count == 5 = do
    putStrLn $ drawBoard $ getBoard game
    putStrLn "Which cell would you like to mark?"
    coords <- getLine
    return $ markBoard game (Position (read coords :: (Int, Int)))
  | otherwise = do
    putStrLn $ drawBoard $ getBoard game
    putStrLn "Which cell would you like to mark?"
    coords <- getLine
    gameLoop (count + 1) (markBoard game (Position (read coords :: (Int, Int))))

main :: IO ()
main = do
  putStrLn "Please input size of board."
  boardSize <- getLine
  (gameLoop 0) $ (flip Game PlayerX) $ createBoard $ read boardSize
  putStrLn "Thanks for playing"
  --putStrLn $ drawBoard $ getBoard $ (flip markBoard (Position (1,2))) $ (flip Game PlayerX) $ createBoard $ read boardSize
  --putStrLn $ show $ startGame $ read boardSize
