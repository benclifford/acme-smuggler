module Acme.Smuggler
    ( inj, prj, smuggle, discover
    ) where

import Data.Typeable (Typeable)
import Data.Dynamic (toDyn, fromDynamic)
import System.IO.Unsafe (unsafePerformIO)
import Control.Exception (try, throw, evaluate)

-- | fancy name for smuggle
inj :: Typeable t => t -> a
inj = smuggle

-- | fancy name for discover
prj :: Typeable t => a -> Maybe t
prj = discover

smuggle :: Typeable t => t -> a
smuggle = throw . toDyn

discover :: Typeable t => a -> Maybe t
discover = either (fromDynamic) (const Nothing)
  . unsafePerformIO
  . try
  . evaluate
