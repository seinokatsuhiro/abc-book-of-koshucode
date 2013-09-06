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

import qualified System.Environment      as Sys
import qualified Data.List               as List
import qualified Data.Char               as Char
import qualified Koshucode.Baala.Base    as B
import qualified Koshucode.Baala.Core    as C
import qualified Koshucode.Baala.Vanilla as V

infix 0 -:-
(-:-) :: a -> b -> (a, b)
(-:-) = (,)

main :: IO ()
main = 
    do (termFile : draftFiles) <- Sys.getArgs
       terms  <- readTerm termFile
       sectJs <- mapM (indexJudge terms) draftFiles
       let termJs = map termJudge terms
       B.putJudges $ termJs ++ sectJs


-- ----------------------  Judges

sectJudge :: String -> [String] -> B.Judge V.VContent
sectJudge sect terms =
    B.Judge True "SECT"
         [ "/sect"   -:- C.putText sect
         , "/terms"  -:- C.putTextSet terms ]

termJudge :: Term -> B.Judge V.VContent
termJudge term =
    B.Judge True "TERM"
         [ "/term"  -:- C.putText (termWord term)
         , "/furi"  -:- C.putText (termFuri term) ]


-- ----------------------  Terms

data Term = Term
    { termWord :: String
    , termFuri :: String
    } deriving (Show)

readTerm :: FilePath -> IO [Term]
readTerm path =
    do text <- readFile path
       return $ map makeTerm . delComment . B.linesCrlf $ text

delComment :: [String] -> [String]
delComment = filter (not . isComment)

isComment :: String -> Bool
isComment = ("--" `List.isPrefixOf`)

makeTerm :: String -> Term
makeTerm s = case B.divide ':' s of
           [w,f] -> Term (trim w) (trim f)
           _     -> error $ "expect word and furigana : " ++ s

trim :: String -> String
trim = B.trimLeft . reverse . B.trimLeft . reverse


-- ----------------------  INDEX judge

indexJudge :: [Term] -> String -> IO (B.Judge V.VContent)
indexJudge terms draftFile =
    do draft <- readFile draftFile
       let sect = theSection draftFile
       return $ sectJudge sect $ draft `contains` map termWord terms

contains :: String -> [String] -> [String]
contains draft = filter (`List.isInfixOf` draft)


-- ----------------------  Section name

theSection :: String -> String
theSection path =
    case List.find isOneLetter $ B.divide '/' path of
      Just sect -> sect
      Nothing   -> error $ "unknown section : " ++ path

isOneLetter :: String -> Bool
isOneLetter [c] | Char.isAlpha c = True
isOneLetter _ = False

