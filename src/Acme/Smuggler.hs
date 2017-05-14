module Acme.Smuggler
    ( inj, prj, smuggle, discover
    ) where

import Data.Typeable (Typeable)
import Data.Dynamic (toDyn, fromDynamic)
import System.IO.Unsafe (unsafePerformIO)
import Control.Exception (try, throw)

-- | fancy name for smuggle
inj :: Typeable t => t -> ()
inj = smuggle

-- | fancy name for discover
prj :: Typeable t => () -> Maybe t
prj = discover

smuggle :: Typeable t => t -> ()
smuggle = unsafePerformIO . throw . toDyn

discover :: Typeable t => () -> Maybe t
discover = either (fromDynamic) (const Nothing)
  . unsafePerformIO
  . try
  . (pure $!)
