module Idringen.Build where

import Idringen.Plugin (IdringenPlugin (..))

import System.Directory
import System.Process
import Data.String.Utils

plugin :: IdringenPlugin
plugin = IdringenPlugin $
  \args -> do
    files <- getDirectoryContents "."
    let pkgfile = head $ filter (endswith ".ipkg") files
    rawSystem "idris" ["--build", pkgfile]
    return ()
