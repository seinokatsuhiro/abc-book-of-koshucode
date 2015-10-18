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
import qualified Koshucode.Baala.Data                   as D
import qualified Koshucode.Baala.Core                   as C
import qualified Koshucode.Baala.Op.Global              as Op
import qualified Koshucode.Baala.Rop                    as Op
import qualified Koshucode.Baala.Rop.Message            as Msg
import qualified Koshucode.Baala.Type.Vanilla           as Type
import qualified Koshucode.Baala.Toolkit.Main.KoshuMain as Main
import qualified Paths_koshu_w                          as Paths


-- ----------------------  main

-- Main function of koshu calculator.
main :: IO ()
main = B.exitWith =<< Main.koshuMain koshuGlobal

-- The global parameter that includes user-defined operator.
koshuGlobal :: C.Global Type.VContent
koshuGlobal = C.globalRopsAdd userRops g' where
    g' = Op.vanillaGlobal
         { C.globalSynopsis  = "The ABC of Koshucode"
         , C.globalVersion   = Paths.version }

-- User-defined relmap operator
userRops :: [C.Rop Type.VContent]
userRops = Op.ropList "user"
    [ Op.def consDivide "divide /T /T /T /T"  "E -1 -2 -3 -4" ]


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

consDivide :: (D.CDec c) => C.RopCons c
consDivide use =
  do x <- Op.getTerm use "-1"
     y <- Op.getTerm use "-2"
     q <- Op.getTerm use "-3"
     r <- Op.getTerm use "-4"
     Right $ C.relmapFlow use $ relkitDivide [x, y, q, r]

relkitDivide :: (D.CDec c) => [D.TermName] -> C.RelkitFlow c
relkitDivide ns@[_, _, q, r] he1'@(Just he1)
    | D.termsPN [xi, yi] [qi, ri] = relkitDivideQR (xi, yi, q, r) he1'
    | otherwise = Msg.unkTerm ns he1
    where
      [xi, yi, qi, ri] = ns `B.snipFull` D.headNames he1
relkitDivide _ _ = Right C.relkitNothing

relkitDivideQR :: forall c. (D.CDec c)
    => (Int, Int, D.TermName, D.TermName) -> C.RelkitFlow c
relkitDivideQR _ Nothing = Right C.relkitNothing
relkitDivideQR (xi, yi, q, r) (Just he1) = Right kit2 where
    he2    = D.headAppend [q, r] he1
    kit2   = C.relkitJust he2 $ C.RelkitOneToAbMany False kitf2 []
    kitf2 _ cs1 =
        do let [xc, yc] = B.snipFrom [xi, yi] cs1
               xDec     = D.gDec xc
               yDec     = D.gDec yc

           if D.isDecimalZero yDec
           then Right []
           else consQR xDec yDec cs1

    consQR :: D.Decimal -> D.Decimal -> [c] -> B.Ab [[c]]
    consQR xDec yDec cs1 =
        do qDec <- D.decimalQuo xDec yDec
           rDec <- D.decimalRem xDec yDec
           Right [D.pDec qDec : D.pDec rDec : cs1]

