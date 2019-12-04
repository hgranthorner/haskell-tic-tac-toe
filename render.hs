-- | render tic tac toe board
module Render where

import Model

drawBoard :: Board -> String
drawBoard gameBoard = snd $ drawCell (gameBoard, "") 0

drawCell :: (Board, String) -> Int -> (Board, String)
drawCell (gameBoard, currentStr) index
  | index == 0 = drawCell (gameBoard, currentCell) (index + 1)
  | index == ((size gameBoard) ^ 2) - 1 = (gameBoard, currentStr ++ newCell)
  | index `mod` (size gameBoard) == 0 =
    drawCell (gameBoard, currentStr ++ newLine) (index + 1)
  | otherwise = drawCell (gameBoard, currentStr ++ newCell) (index + 1)
  where
    currentCell = renderCell $ (currentState gameBoard) !! index
    boardSize = size gameBoard
    horDivider = (take (boardSize * 2 - 1) $ repeat '-')
    newLine = "\n" ++ horDivider ++  "\n" ++ currentCell
    newCell = "|" ++ currentCell

renderCell :: Mark -> String
renderCell mark
  | markType mark == Empty = " "
  | otherwise = show $ markType mark
