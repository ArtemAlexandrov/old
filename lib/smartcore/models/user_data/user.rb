module Smartcore
  module Models
    class User < BaseModel

      attribute :first_name,          String
      attribute :last_name,           String
      attribute :patronymic,          String

      attribute :email,               Date
      attribute :phone,               String

      attribute :is_male,             Boolean
      attribute :birthday,            Date

      attribute :verification_type,   Symbol
      attribute :verification_state,  Symbol

      attribute :accept_terms,        Boolean
      attribute :avatar,              String
      attribute :document_scan_id,    String
      attribute :document_scan,       Smartcore::Models::DocumentScan

      attribute :site_data,           Hash

      attribute :valid,               Boolean

      attribute :brand_id,            String
      attribute :brand,               Smartcore::Models::Brand
      attribute :cigarette_format_id, String
      attribute :cigarette_format,    Smartcore::Models::CigaretteFormat

      attribute :secondary_brand_id,  String
      attribute :secondary_brand,     Smartcore::Models::Brand

      attribute :city_id,             String
      attribute :city,                Smartcore::Models::City

      attribute :street,              String
      attribute :postcode,            String

      attribute :client,              Smartcore::Models::Client

    end
  end
end
