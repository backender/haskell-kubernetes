-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.ComponentStatusList
    ( ComponentStatusList (..)
    , kind
    , apiVersion
    , metadata
    , items
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()
import           Kubernetes.Model.Unversioned.ListMeta (ListMeta)
import           Kubernetes.Model.V1.ComponentStatus (ComponentStatus)

-- | Status of all the conditions for the component as a list of ComponentStatus objects.
data ComponentStatusList = ComponentStatusList
    { _kind :: Maybe Text
    , _apiVersion :: Maybe Text
    , _metadata :: Maybe ListMeta
    , _items :: [ComponentStatus]
    } deriving (Show, Eq, Generic)

makeLenses ''ComponentStatusList

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''ComponentStatusList)

instance Arbitrary ComponentStatusList where
    arbitrary = ComponentStatusList <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary