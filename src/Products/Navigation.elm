module Products.Navigation where

import Products.Product exposing (Product)

type Action = SelectFeaturesView
            | SelectDomainTermsView
            | SelectUserRolesView
            | SetSelectedProduct Product
            | ShowCreateNewProductForm

type CurrentView = LoadingView
                 | ErrorView String
                 | CreateProductFormView
                 | ProductView
                 | DomainTermsView
                 | UserRolesView
