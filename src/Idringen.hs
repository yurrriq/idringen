module Idringen where

import Control.Monad
import Data.Char
import Data.List (intercalate)
import Debug.Trace (traceIO)

import qualified Idringen.New as New
import qualified Idringen.Build as Build
import Idringen.Plugin

newtype Command = Command { unCommand :: String }
newtype CommandArgs = CommandArgs { unCommandArgs :: [String] }

openKeg :: Command -> CommandArgs -> IO ()
openKeg c a = do
  let command = unCommand c
      args = unCommandArgs a
      plugin = case toLower `fmap` command of
                 "new" -> New.plugin
                 "build" -> Build.plugin
                 c -> error $ "not support subcmd " ++ c ++ " yet"
  run plugin args
