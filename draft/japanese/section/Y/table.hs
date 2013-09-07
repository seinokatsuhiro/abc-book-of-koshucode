#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
-- ------------------------------------------------------------
--
--  DESCRIPTION
--    Generate index table in markdown.
--    
--    Input is in koshucode
--      |-- INDEX  /order text
--                 /word  text
--                 /sects [ text ]
--    
--    Output is in markdown table
--      | order | word | [`A`][A] ... |
--
--  USAGE
--    ./table.hs INDEX /order /word /sects A-B-C-D-E-F-G
--
-- ------------------------------------------------------------

import qualified Data.List                as List
import qualified Data.Maybe               as Maybe
import qualified System.Environment       as Sys
import qualified Text.PrettyPrint         as Pretty
import qualified Koshucode.Baala.Base     as B
import qualified Koshucode.Baala.Core     as C
import qualified Koshucode.Baala.Vanilla  as V

data Param = Param
    { paramPattern :: String
    , paramOrder   :: String
    , paramLine    :: String
    , paramColumn  :: String
    , paramAlpha   :: String
    } deriving (Show)

paramPages :: Param -> [String]
paramPages Param { paramAlpha = alpha } = B.divide '-' alpha

main :: IO ()
main =
    do [pat, order, line, column, alpha] <- Sys.getArgs
       let param = Param pat order line column alpha
       code <- getContents
       case C.readJudges code :: B.AbortOr [B.Judge V.VContent] of
         Right js -> B.putLines $ indexLines param js
         Left a   -> B.abort a

indexLines :: (C.CContent c) => Param -> [B.Judge c] -> [String]
indexLines param = List.sort . map (indexLine param)

indexLine :: (C.CContent c) => Param -> B.Judge c -> String
indexLine param (B.Judge True p xs)
    | p == paramPattern param
        = show $ B.doch line where
    the n = Maybe.fromJust $ lookup n xs
    order = C.getText $ the (paramOrder param)
    word  = C.getText $ the (paramLine  param)
    sects = List.sort $ getTextList $ the (paramColumn param)
    bar   = B.doc "|"
    line  = [ bar, B.doc (B.padRight 28 order)
            , bar, B.doc word
            , bar, Pretty.hcat $ map B.doc $ linkCode param sects
            , bar ]
indexLine p j = error $ show (p, j)

getTextList :: (C.CText c, C.CList c) => c -> [String]
getTextList = map C.getText . C.getList

linkCode :: Param -> B.Map [String]
linkCode param files = map link $ sourceList param where
    link x | x `elem` files = "[`" ++ x ++ "`][" ++ x ++ "]"
           | otherwise      = "`-`"

sourceList :: Param -> [String]
sourceList param = filter (/= "-") $ paramPages param

