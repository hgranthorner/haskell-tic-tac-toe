-- | tic tac toe models

module Model where

data Player = PlayerX | PlayerO deriving (Show, Eq)
data Position = Position (Int, Int) deriving (Show, Eq)
data MarkType = X | O | Empty deriving (Show, Eq)
data Mark = Mark { position :: Position
                 , markType :: MarkType
                 } deriving (Show, Eq)
data Board = Board { size :: Int
                   , currentState :: [Mark]
                   } deriving (Show)
data Game = Game { board :: Board
                 , turn :: Player
                 } deriving (Show)
