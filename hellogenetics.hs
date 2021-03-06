#!/usr/bin/env runhaskell

{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

import Data.Random (RVar, runRVar)
import Data.Random.List (randomElement)
import Data.Random.Source.DevRandom

import Genetics
import Control.Monad (replicateM)
import Data.Char (ord, chr)

target :: String
target = "Hello World!"

generations :: Int
generations = 2 ^ 16

indexSpace :: [Int]
indexSpace = [0 .. length target - 1]

randomIndex :: IO Int
randomIndex = runRVar (randomElement indexSpace) DevRandom

charSpace :: String
charSpace = [' ' .. '~']

randomChar :: IO Char
randomChar = runRVar (randomElement charSpace) DevRandom

randomGene :: IO String
randomGene = replicateM (length target) randomChar

instance Gene String where
  fitness gene = sum (zipWith (\t g -> if t == g then 1 else 0) target gene) / fromIntegral (length target)

  mutate gene = do
    i <- randomIndex
    c <- randomChar
    return $ take i gene ++ [c] ++ drop (i + 1) gene

  species _ = 8

main :: IO ()
main = do
  pool <- replicateM (species [""]) randomGene
  pool' <- evolve generations pool
  putStrLn $ best pool'
