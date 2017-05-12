module Smartcore
  module UserData
    include Virtus.module
    attribute :first_name,          String
    attribute :last_name,           String
    attribute :patronymic,          String

    attribute :login,               String
    attribute :email,               String
    attribute :phone_number,        String

    attribute :gender,              String # male|female
    attribute :birthday,            Date

    attribute :verification_state,  Symbol

    attribute :accept_term_at,      DateTime
    attribute :avatar_url,          String

    attribute :email_confirmed,     Boolean
    attribute :valid,               Boolean
    attribute :subscribed,          Boolean

    attribute :preferred_cigarette_brand,     Smartcore::Models::Brand
    attribute :preferred_cigarette_format,    Smartcore::Models::CigaretteFormat

    attribute :secondary_cigarette_brand,     Smartcore::Models::Brand
    attribute :secondary_cigarette_format,    Smartcore::Models::CigaretteFormat

    attribute :country,             Smartcore::Models::Country
    attribute :city,                Smartcore::Models::City

    attribute :street,              String
    attribute :postcode,            String
    attribute :marks,               Hash

    attribute :oauth_credentials,   Array[Smartcore::Models::OAuthCredential]

    attribute :client,              Smartcore::Models::Client
    attribute :created_at,          DateTime
    attribute :email_confirmation_token,  String
  end
end