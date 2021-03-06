module App.Products.UserRoles.Messages exposing ( Msg (..) )

import App.Search.Types as Search
import App.Products.UserRoles.UserRole exposing (UserRole)
import Http                            exposing (Error)

type Msg = HideUserRoleForm
         | RemoveUserRole UserRole
         | SearchFeatures Search.Query
         | SetUserRoleDescription String
         | SetUserRoleTitle String
         | ShowCreateUserRoleForm
         | ShowEditUserRoleForm UserRole
         | SubmitUserRoleForm
         | UserRoleUpdated UserRole
         | FetchUserRolesSucceeded (List UserRole)
         | FetchUserRolesFailed Error
         | CreateUserRoleSucceeded UserRole
         | CreateUserRoleFailed Error
         | UpdateUserRoleSucceeded UserRole
         | UpdateUserRoleFailed Error
         | DeleteUserRoleSucceeded UserRole
         | DeleteUserRoleFailed Error

