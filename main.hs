-- | play tic tac toe in console
module Main where

import Data.List
import Helpers
import Logic
import Model
import Render

rejectMove :: Int -> Game -> IO Game
rejectMove count game = do
  putStrLn "Invalid move."
  gameLoop count game


gameLoop :: Int -> Game -> IO Game
gameLoop count game = do
  putStrLn $ drawBoard $ getBoard game
  putStrLn "\n"
  putStrLn "Which cell would you like to mark?"
  coords <- getLine
  if not $ validateMove (getBoard game) (strToPosn coords)
    then rejectMove count game
    else if count == 3
           then return $ markBoard game (strToPosn coords)
           else gameLoop (count + 1) (markBoard game (strToPosn coords))

main :: IO ()
main = do
  putStrLn "Please input size of board."
  boardSize <- getLine
  (gameLoop 0) $ (flip Game PlayerX) $ createBoard $ read boardSize
  putStrLn "Thanks for playing"
