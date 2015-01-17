-- ------------------------------------------------------------------
--
--  PROGRAM
--    koshu-w
--
--  NOTE
--    When you use ghci, please :set -idist/build/autogen
--
-- ------------------------------------------------------------------
{-# LANGUAGE DoAndIfThenElse #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import qualified Koshucode.Baala.Base                   as B
import qualified Koshucode.Baala.Core                   as C
import qualified Koshucode.Baala.Op.Global              as Op
import qualified Koshucode.Baala.Op                     as Op
import qualified Koshucode.Baala.Type.Vanilla           as Type
import qualified Koshucode.Baala.Op.Message             as Msg
import qualified Koshucode.Baala.Toolkit.Main.KoshuMain as Main
import qualified Koshucode.Baala.Toolkit.Library.Exit   as Main
import qualified Paths_koshu_w                          as Paths


-- ----------------------  main

main :: IO ()
main = Main.exit =<< Main.koshuMain koshuGlobal where

koshuGlobal :: C.Global Type.VContent
koshuGlobal = C.globalRopsAdd g' userRops where
    g' = Op.vanillaGlobal { C.globalSynopsis = "The ABC of Koshucode"
                          , C.globalVersion  = Paths.version }

-- User-defined relmap operator
userRops :: [C.Rop Type.VContent]
userRops = Op.ropList "user"
    [ Op.ropE consDivide "divide /T /T /T /T"  "-1 -2 -3 -4" ]


-- ----------------------  divide
--
--  SYNOPSIS
--    divide /x /y /q /r
--
--  INTEPRETATION
--    Dividing /x by /y, its quotient is /q
--    and remainder is /r.
--
--  INPUT : OUTPUT
--    /x /y : /q /r
--      1 : 1
--      1 : 0  if /y equals zero, no tuple returns.
--    

consDivide :: (C.CDec c) => C.RopCons c
consDivide use =
  do x <- Op.getTerm use "-1"
     y <- Op.getTerm use "-2"
     q <- Op.getTerm use "-3"
     r <- Op.getTerm use "-4"
     Right $ C.relmapFlow use $ relkitDivide [x, y, q, r]

relkitDivide :: (C.CDec c) => [B.TermName] -> C.RelkitFlow c
relkitDivide ns@[_, _, q, r] he1'@(Just he1)
    | B.operand [xi, yi] [qi, ri] = relkitDivideQR (xi, yi, q, r) he1'
    | otherwise = Msg.unkTerm ns he1
    where
      [xi, yi, qi, ri] = ns `B.snipFull` B.headNames he1
relkitDivide _ _ = Right C.relkitNothing

relkitDivideQR :: forall c. (C.CDec c)
    => (Int, Int, B.TermName, B.TermName) -> C.RelkitFlow c
relkitDivideQR _ Nothing = Right C.relkitNothing
relkitDivideQR (xi, yi, q, r) (Just he1) = Right kit2 where
    he2    = B.headAppend [q, r] he1
    kit2   = C.relkitJust he2 $ C.RelkitOneToAbMany False kitf2 []
    kitf2 _ cs1 =
        do let [xc, yc] = B.snipFrom [xi, yi] cs1
               xDec     = C.gDec xc
               yDec     = C.gDec yc

           if B.isDecimalZero yDec
           then Right []
           else consQR xDec yDec cs1

    consQR :: B.Decimal -> B.Decimal -> [c] -> B.Ab [[c]]
    consQR xDec yDec cs1 =
        do qDec <- B.decimalQuo xDec yDec
           rDec <- B.decimalRem xDec yDec
           Right [C.pDec qDec : C.pDec rDec : cs1]

