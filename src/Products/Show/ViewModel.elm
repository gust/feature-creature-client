module Products.Show.ViewModel where

import Effects                                     exposing (Effects)
import Products.DomainTerms.Index.ViewModel as DTV exposing (DomainTermsView)
import Products.Features.Index.ViewModel as FV     exposing (FeaturesView)
import Products.Product                            exposing (Product)
import Products.Show.Actions                       exposing (Action(..))
import Products.UserRoles.UserRolesView as URV     exposing (UserRolesView)
import Products.Navigation.NavBar as NavBar        exposing (ProductViewNavBar)

type alias ProductView =
  { product         : Product
  , navBar          : ProductViewNavBar
  , featuresView    : FeaturesView
  , domainTermsView : DomainTermsView
  , userRolesView   : UserRolesView
  }

init : List Product -> Product -> (ProductView, Effects Action)
init products selectedProduct =
  let (featView, featuresViewFx)       = FV.init selectedProduct
      (domainTermsView, domainTermsFx) = DTV.init selectedProduct
      (userRolesView, userRolesFx)     = URV.init selectedProduct
      productView = { product          = selectedProduct
                    , navBar           = NavBar.init products selectedProduct
                    , featuresView     = featView
                    , domainTermsView  = domainTermsView
                    , userRolesView    = userRolesView
                    }
  in ( productView
     , Effects.batch [
         Effects.map FeaturesViewAction featuresViewFx
       , Effects.map DomainTermsViewAction domainTermsFx
       , Effects.map UserRolesViewAction userRolesFx
       ]
     )
