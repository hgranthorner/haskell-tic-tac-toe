-- | helper functions

module Helpers where

import Model

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

indexFromPosn :: Position -> Int -> Int
indexFromPosn (Position (posX, posY)) size = ((posY - 1) * size) + posX - 1

changePlayer :: Player -> Player
changePlayer player
  | player == PlayerX = PlayerO
  | player == PlayerO = PlayerX
  | otherwise = PlayerX

createBoard :: Int -> Board
createBoard boardSize = Board boardSize [Mark (Position (x, y)) Empty | x <- [1..boardSize], y <- [1..boardSize]]

swapIn :: [a] -> Int -> a -> [a]
swapIn lst index new = first ++ new : last
  where first = slice 0 (index - 1) lst
        last  = slice (index + 1) (length lst) lst

