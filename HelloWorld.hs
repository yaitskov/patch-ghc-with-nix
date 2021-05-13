module Main where

import Prelude
import Module

main :: IO ()
main = putStrLn ("HELLO WORLD NIX!!!" ++ show (mkModuleName "DDD"))
