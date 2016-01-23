module App.Products.UserRoles.Forms.ViewModel
  ( UserRoleForm
  , init
  ) where

import Html                                  exposing (Html)
import App.Products.UserRoles.Forms.Actions  exposing (..)
import App.Products.Product                  exposing (Product)
import App.Products.UserRoles.UserRole as UR exposing (UserRole)
import UI.App.Primitives.Forms     as UI     exposing (InputField)

type alias UserRoleForm =
  { product : Product
  , userRoleFormVisible  : Bool
  , newUserRole          : UserRole
  , titleField           : InputField Action
  , descriptionField     : InputField Action
  }

init : Product -> UserRoleForm
init prod =
  { product              = prod
  , userRoleFormVisible  = False
  , newUserRole          = UR.init
  , titleField           = defaultTitleField
  , descriptionField     = defaultDescriptionField
  }

defaultTitleField : InputField Action
defaultTitleField =
  { inputName = "userRoleTitle"
  , labelContent = (Html.text "Title")
  , inputParser = SetUserRoleTitle
  , validationErrors = []
  }

defaultDescriptionField : InputField Action
defaultDescriptionField =
  { inputName = "userRoleDescription"
  , labelContent = (Html.text "Description")
  , inputParser = SetUserRoleDescription
  , validationErrors = []
  }