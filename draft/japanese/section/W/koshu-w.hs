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
{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import qualified Koshucode.Baala.Base as B
import qualified Koshucode.Baala.Core as C
import qualified Koshucode.Baala.Builtin as Rop
import qualified Koshucode.Baala.Vanilla as Rop
import qualified Koshucode.Baala.Toolkit.Main.KoshuMain as Main
import qualified Koshucode.Baala.Toolkit.Library.Exit   as Main
import qualified Paths_koshu_w as Paths


-- ----------------------  main

main :: IO ()
main = Main.exit =<< Main.koshuMain g where
    rops = C.globalRops Rop.vanillaGlobal
    g = Rop.vanillaGlobal { C.globalVersion = Paths.version
                          , C.globalRops    = userRops ++ rops }

-- User-defined relmap operator
userRops :: [C.Rop Rop.VContent]
userRops = Rop.ropList "user"
    [ ( "divide /T /T /T /T", consDivide, C.sortEnum ["-1", "-2", "-3", "-4"] [] ) ]


-- ----------------------  divide operator
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
  do x <- Rop.getTerm use "-1"
     y <- Rop.getTerm use "-2"
     q <- Rop.getTerm use "-3"
     r <- Rop.getTerm use "-4"
     Right $ C.relmapCalc use $ relkitDivide (x, y, q, r)

relkitDivide :: (C.CDec c) => B.Termname4 -> B.Relhead -> B.Ab (C.Relkit c)
relkitDivide (x, y, q, r) h1
    | xHere && yHere && not qHere && not rHere
        = relkitDivideQR xPos yPos q r h1
    | otherwise
        = Left $ B.abortTermIO ns here
    where
      ns = [x, y, q, r]
      ( [xPos, yPos, _, _],
        here@[xHere, yHere, qHere, rHere] )
          = B.posHere h1 ns

relkitDivideQR
    :: (C.CDec c)
    => B.TermPos -> B.TermPos -> B.Termname -> B.Termname
    -> B.Relhead
    -> B.Ab (C.Relkit c)
relkitDivideQR xPos yPos q r h1 =
    Right $ C.relkit h2 (C.RelkitOneToAbMany False consQR)
    where
      h2     = B.headCons2 q r h1
      xyPick = B.posPick [xPos, yPos]

      consQR :: (C.CDec c) => [c] -> B.Ab [[c]]
      consQR cs =
          do let [xCont, yCont] = xyPick cs
             xDec <- C.needDec xCont
             yDec <- C.needDec yCont

             if B.isDecimalZero yDec
             then Right []
             else consQR2 xDec yDec cs

      consQR2 xDec yDec cs =
          do qDec <- B.decimalQuo xDec yDec
             rDec <- B.decimalRem xDec yDec
             Right [C.putDec qDec : C.putDec rDec : cs]

