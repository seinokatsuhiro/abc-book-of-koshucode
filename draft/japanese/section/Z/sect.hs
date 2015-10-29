#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
-- ------------------------------------------------------------
--
--  DESCRIPTION
--    Generate dataset for index
--    
--    Output is in koshucode
--      |-- TERM  /term text
--                /furi text
--      |-- SECT  /sect text
--                /terms { text }
--
--  USAGE
--    ./sect.hs TERM.txt ../[A-X]/*.md
--
-- ------------------------------------------------------------

import qualified System.Environment            as Sys
import qualified Data.List                     as List
import qualified Data.Char                     as Char
import qualified Koshucode.Baala.Base          as B
import qualified Koshucode.Baala.Data          as D
import qualified Koshucode.Baala.Core          as C
import qualified Koshucode.Baala.Writer        as W

infix 0 +-
(+-) :: a -> b -> (a, b)
(+-) = (,)

main :: IO ()
main = 
    do (termFile : mdFiles) <- Sys.getArgs
       heading

       terms <- readTerm termFile
       let termJs = map termJudge terms

       sectJs <- sectJudges terms `mapM` mdFiles
       let js = termJs ++ sectJs

       _ <- W.putJudges js
       return ()

heading :: IO ()
heading =
    do putStrLn "-*- koshu -*-"
       putStrLn "**"
       putStrLn "**  INTERPRETATION"
       putStrLn "**    TERM <<< /term is pronounced as /furi. >>>"
       putStrLn "**    SECT <<< Words in /terms is in /sect. >>>"
       putStrLn "**"
       putStrLn ""


-- ----------------------  Judges

sectJudge :: String -> [String] -> C.JudgeC
sectJudge sect terms =
    D.JudgeAffirm "SECT"
         [ "sect"   +- D.pText sect
         , "terms"  +- D.pSet (map D.pText terms) ]

termJudge :: Term -> C.JudgeC
termJudge term =
    D.JudgeAffirm "TERM"
         [ "term"   +- D.pText (termWord term)
         , "furi"   +- D.pText (termFuri term) ]


-- ----------------------  Terms

data Term = Term
    { termWord :: String
    , termFuri :: String
    } deriving (Show)

readTerm :: FilePath -> IO [Term]
readTerm path =
    do text <- readFile path
       return $ map makeTerm $ omitLines $ B.linesCrlf text

o :: B.Bin (a -> Bool)
o f g x = f x || g x

omitLines :: B.Map [String]
omitLines = B.omit (null `o` isComment)

isComment :: String -> Bool
isComment = ("--" `List.isPrefixOf`)

makeTerm :: String -> Term
makeTerm s = case B.divide ':' s of
               [w,f] -> Term (trim w) (trim f)
               _     -> error $ "expect word and furigana : " ++ s

trim :: B.Map String
trim = B.trimLeft . reverse . B.trimLeft . reverse


-- ----------------------  SECT judge

sectJudges :: [Term] -> FilePath -> IO (C.JudgeC)
sectJudges terms path =
    do text <- readFile path
       let sect = theSection path
           ws   = text `contains` map termWord terms
       return $ sectJudge sect ws

contains :: String -> [String] -> [String]
contains text = filter (`List.isInfixOf` text)

theSection :: B.Map FilePath
theSection path =
    case List.find isOneLetter $ B.divide '/' path of
      Just sect -> sect
      Nothing   -> error $ "unknown section : " ++ path

isOneLetter :: String -> Bool
isOneLetter [c] | Char.isAlpha c = True
isOneLetter _                    = False

