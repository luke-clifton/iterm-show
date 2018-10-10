{-# LANGUAGE OverloadedStrings #-}
module ITermShow
    ( displayImageBuilder
    , displayImage
    , displayImageString
    ) where

import qualified Data.ByteString.Lazy.Char8 as LB
import qualified Data.ByteString.Lazy.Builder as LB
import qualified Data.ByteString.Base64.Lazy as LB64

-- | Wrap and transform a bytestring representing the encoding of
-- a file that iTerm understands how to display such that iTerm
-- will display it when the resulting bytestring is printed to the
-- terminal.
displayImageBuilder :: LB.ByteString -> LB.Builder
displayImageBuilder bs = mconcat
    [ LB.byteString "\x1b]1337;File=inline=1:"
    , LB.lazyByteString $ LB64.encode bs
    , LB.byteString "\x07"
    ]

-- | Convinience wrapper around displayImageBuilder
displayImage :: LB.ByteString -> LB.ByteString
displayImage = LB.toLazyByteString . displayImageBuilder

-- | Convinience wrapper around displayImageBuilder. Useful for `Show`
-- instances.
displayImageString :: LB.ByteString -> String
displayImageString = LB.unpack . displayImage

