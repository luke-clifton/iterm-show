module Main where

import ITermShow
import System.Environment (getArgs)
import qualified Data.ByteString.Lazy as B
import Control.Monad

main :: IO ()
main = getArgs >>= mapM_ showFile

showFile :: FilePath -> IO ()
showFile f = B.readFile f >>= B.putStr . displayImage
