-- | helper functions

module Helpers where

import Data.Function
import Data.List

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

getX :: Mark -> Int
getX = f . getPosition
  where f (Position (x, _)) = x

getY :: Mark -> Int
getY = f . getPosition
  where f (Position (_, y)) = y

groupRow :: Board -> [[Mark]]
groupRow = groupBy (\a b -> getX a == getX b) . sortBy (compare `on` getX) . getCurrentState

groupCol :: Board -> [[Mark]]
groupCol = groupBy (\a b -> getY a == getY b) . sortBy (compare `on` getY) . getCurrentState

allEq :: Eq a => [a] -> Bool
allEq lst = null $ snd $ span (== head lst) lst
