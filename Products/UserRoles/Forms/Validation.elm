module Products.UserRoles.Forms.Validation
  ( validateForm
  , hasErrors
  ) where

import Products.UserRoles.Forms.Model    exposing (..)
import UI.App.Primitives.Forms     as UI exposing (requiredStringFieldValidation)

validateForm : UserRoleForm -> UserRoleForm
validateForm form =
  let userRole            = form.newUserRole
      titleField          = form.titleField
      descriptionField    = form.descriptionField
      newTitleField       = { titleField | validationErrors       = validateTitle userRole.title }
      newDescriptionField = { descriptionField | validationErrors = validateDescription userRole.description }
  in
     { form | titleField = newTitleField
            , descriptionField = newDescriptionField
     }

validateTitle : String -> (List String)
validateTitle = requiredStringFieldValidation

validateDescription : String -> (List String)
validateDescription = requiredStringFieldValidation

hasErrors : UserRoleForm -> Bool
hasErrors = not << isSubmittable

isSubmittable : UserRoleForm -> Bool
isSubmittable userRoleForm =
  let titleField       = userRoleForm.titleField
      descriptionField = userRoleForm.descriptionField
  in
     (List.isEmpty titleField.validationErrors)
     && (List.isEmpty descriptionField.validationErrors)

