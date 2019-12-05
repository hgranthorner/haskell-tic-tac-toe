-- | render tic tac toe board
module Render where

import Model

drawBoard :: Board -> String
drawBoard gameBoard = snd $ drawCell (gameBoard, "") 0

drawCell :: (Board, String) -> Int -> (Board, String)
drawCell (gameBoard, currentStr) index
  | index == 0 = drawCell (gameBoard, currentCell) (index + 1)
  | index == ((getSize gameBoard) ^ 2) - 1 = (gameBoard, currentStr ++ newCell)
  | index `mod` (getSize gameBoard) == 0 =
    drawCell (gameBoard, currentStr ++ newLine) (index + 1)
  | otherwise = drawCell (gameBoard, currentStr ++ newCell) (index + 1)
  where
    currentCell = renderCell $ (getCurrentState gameBoard) !! index
    boardSize = getSize gameBoard
    horDivider = (take (boardSize * 2 - 1) $ repeat '-')
    newLine = "\n" ++ horDivider ++  "\n" ++ currentCell
    newCell = "|" ++ currentCell

renderCell :: Mark -> String
renderCell mark
  | getMarkType mark == Empty = " "
  | otherwise = show $ getMarkType mark
