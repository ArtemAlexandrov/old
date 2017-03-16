module Smartcore
  module UserData
    include Virtus.module
    attribute :first_name,          String
    attribute :last_name,           String
    attribute :patronymic,          String

    attribute :login,               String
    attribute :email,               String
    attribute :phone,               String

    attribute :is_male,             Boolean
    attribute :birthday,            Date

    attribute :verification_type,   Symbol
    attribute :verification_state,  Symbol

    attribute :accept_terms,        Boolean
    attribute :avatar_url,          String

    attribute :site_data,           Hash

    attribute :valid,               Boolean

    attribute :preferred_cigarette_brand,     Smartcore::Models::Brand
    attribute :preferred_cigarette_format,    Smartcore::Models::CigaretteFormat

    attribute :secondary_cigarette_brand,     Smartcore::Models::Brand
    attribute :secondary_cigarette_format,    Smartcore::Models::CigaretteFormat

    attribute :city,                Smartcore::Models::City

    attribute :street,              String
    attribute :postcode,            String
    attribute :marks,               Hash

    attribute :client,              Smartcore::Models::Client
  end
end