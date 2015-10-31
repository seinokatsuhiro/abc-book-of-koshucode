#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
-- ------------------------------------------------------------
--
--  DESCRIPTION
--    Generate index matrix in markdown.
--    
--    Input is in koshucode
--      |-- INDEX  /order text
--                 /word  text
--                 /sects [ text ]
--    
--    Output is in markdown table
--      | order | word | <code> ··· [K][K] ···  </code> |
--
--  USAGE
--    ./maxtrix.hs INDEX /order /word /sects A-B-C-D-E-F-G
--
-- ------------------------------------------------------------

import qualified Data.List                               as List
import qualified System.Environment                      as Sys
import qualified Text.PrettyPrint                        as Pretty
import qualified Koshucode.Baala.Base                    as B
import qualified Koshucode.Baala.Data                    as D
import qualified Koshucode.Baala.Core                    as C
import qualified Koshucode.Baala.Toolkit.Library.Global  as K

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
           res   = C.resEmpty { C.resGlobal = K.baalaGlobal } :: C.ResourceC
       code <- getContents
       case C.readResourceText res code of
         Right res' -> B.putLines $ indexLines param $ C.resJudge res'
         Left a     -> B.abort [] a

indexLines :: (D.CContent c) => Param -> [D.Judge c] -> [String]
indexLines param = List.sort . map (indexLine param)

indexLine :: (D.CContent c) => Param -> D.Judge c -> String
indexLine param (D.JudgeAffirm p xs)
    | p == paramPattern param
        = show $ B.doch line where
    the ('/':n)  = case lookup n xs of
                     Just v  -> v
                     Nothing -> error n
    the n  = error n
    order  = D.gText $ the (paramOrder param)
    word   = D.gText $ the (paramLine  param)
    sects  = List.sort $ getTextList $ the (paramColumn param)
    bar    = B.doc "|"
    code x = B.doc "<code>" B.<> x B.<> B.doc "</code>"
    line   = [ bar, B.doc (B.padRight 28 order)
             , bar, B.doc word
             , bar, code $ Pretty.hsep $ map B.doc $ linkCode param sects
             , bar ]
indexLine p j = error $ show (p, j)

getTextList :: (D.CText c, D.CList c) => c -> [String]
getTextList = map D.gText . D.gList

linkCode :: Param -> B.Map [String]
linkCode param files = map link $ sourceList param where
    link x | x `elem` files = "[" ++ x ++ "][" ++ x ++ "]"
           | otherwise      = "·"

sourceList :: Param -> [String]
sourceList param = filter (/= "-") $ paramPages param

