#!/usr/bin/env runhaskell
{-# LANGUAGE DoAndIfThenElse #-}
{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import qualified Koshucode.Baala.Base as B
import qualified Koshucode.Baala.Core as C
import qualified Koshucode.Baala.Builtin as Rop
import qualified Koshucode.Baala.Minimal as Rop
import qualified Koshucode.Baala.Vanilla as Rop
import qualified Koshucode.Baala.Toolkit.Main.KoshuMain as Main

main :: IO ()
main = Main.koshuMain rops where
    rops = userRops
           ++ Rop.builtinRops
           ++ Rop.minimalRops
           ++ Rop.vanillaRops

userRops :: [C.Rop Rop.VContent]
userRops = Rop.ropList "user"
    [ o "divide /N /N /N /N" Rop.LikePos ropConsDivide
    ] where o = (,,)

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
--    case /x /y : /q /r
--      1 : 1
--      1 : 0  if /y equals zero, no tuple returns.
--    otherwise error
--    

ropConsDivide :: (C.CDec c) => C.RopCons c
ropConsDivide use =
  do x <- Rop.getTerm use "-1"
     y <- Rop.getTerm use "-2"
     q <- Rop.getTerm use "-3"
     r <- Rop.getTerm use "-4"
     Right $ relmapDivide use x y q r

relmapDivide
    :: (C.CDec c) => C.RopUse c 
    -> String -> String -> String -> String
    -> C.Relmap c
relmapDivide use x y q r = C.relmapCalc use "divide" fy where
    fy _ = relfyDivide x y q r

relfyDivide
    :: (C.CDec c)
    => String -> String -> String -> String
    -> B.Relhead
    -> B.Ab (C.Relfy c)
relfyDivide x y q r h1
    | xHere && yHere && not qHere && not rHere
        = relfyDivideQR xPos yPos q r h1
    | otherwise
        = Left $ B.AbortNoTerms [x, y, q, r]
    where
      ( [xPos, yPos, _, _],
        [xHere, yHere, qHere, rHere] )
          = B.posHere h1 [x, y, q, r]

relfyDivideQR
    :: (C.CDec c)
    => B.TermPos -> B.TermPos -> String -> String
    -> B.Relhead
    -> B.Ab (C.Relfy c)
relfyDivideQR xPos yPos q r h1 =
    Right $ C.Relfy h2 (C.RelfyOneToAbMany False consQR)
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

