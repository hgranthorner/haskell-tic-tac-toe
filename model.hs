-- | tic tac toe models

module Model where

data Player = PlayerX | PlayerO deriving (Show, Eq)
data Position = Position { getCoordinates :: (Int, Int)
                         } deriving (Show, Eq)
data MarkType = X | O | Empty deriving (Show, Eq)
data Mark = Mark { getPosition :: Position
                 , getMarkType :: MarkType
                 } deriving (Show, Eq)
data Board = Board { getSize :: Int
                   , getCurrentState :: [Mark]
                   } deriving (Show)
data Game = Game { getBoard :: Board
                 , getTurn :: Player
                 } deriving (Show)

strToPosn :: String -> Position
strToPosn tup = Position (read tup :: (Int, Int))
