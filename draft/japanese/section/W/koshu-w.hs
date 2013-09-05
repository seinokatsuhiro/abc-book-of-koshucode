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
relmapDivide use x y q r = C.relmapCalc use "divide" sub where
    sub _ r1 = relDivide x y q r r1

relDivide
    :: (C.CDec c)
    => String -> String -> String -> String
    -> B.AbMap (B.Rel c)
relDivide x y q r r1
    | xHere && yHere && not qHere && not rHere
        = relDivideQR xPos yPos q r r1
    | otherwise
        = Left $ B.AbortNoTerms [x, y, q, r]
    where
      ( [xPos, yPos, _, _],
        [xHere, yHere, qHere, rHere] )
          = B.relPosHere r1 [x, y, q, r]

relDivideQR
    :: (C.CDec c)
    => B.TermPos -> B.TermPos -> String -> String
    -> B.AbMap (B.Rel c)
relDivideQR xPos yPos q r (B.Rel h1 b1) =
    do b2 <- mapM consQR b1
       Right $ B.Rel h2 $ concat b2
    where
      h2     = B.headCons2 q r h1
      xyPick = B.posPick [xPos, yPos]

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

