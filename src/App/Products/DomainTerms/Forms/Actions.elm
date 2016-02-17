module App.Products.DomainTerms.Forms.Actions
  ( DomainTermFormAction(..) ) where

import App.Products.DomainTerms.DomainTerm exposing (DomainTerm)
import Http                                exposing (Error)

type DomainTermFormAction = AddDomainTerm (Result Error DomainTerm)
                          | SubmitDomainTermForm
                          | SetDomainTermTitle String
                          | SetDomainTermDescription String
