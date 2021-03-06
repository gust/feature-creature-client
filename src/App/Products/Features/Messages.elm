module App.Products.Features.Messages exposing ( Msg (..) )

import App.Products.Features.Feature           exposing (Feature)
import App.Products.Navigation as Navigation
import App.Search.Types                        exposing (Query)
import Data.DirectoryTree                      exposing (DirectoryTree, FileDescription)
import Http                                    exposing (..)

type Msg = ShowFeature FileDescription
         | Noop
         | RequestFeatures
         | ShowFeatureDetails (Result Error Feature)
         | UpdateFeatures (Maybe Query) (Result Error DirectoryTree)
         | FetchFeaturesSucceeded (Maybe Query) DirectoryTree
         | FetchFeaturesFailed Error
         | FetchFeatureSucceeded Feature
         | FetchFeatureFailed Error
         | NavigationMsg Navigation.Msg
