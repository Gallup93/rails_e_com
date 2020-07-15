class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  has_many :invoices
  has_many :items
  attributes :id, :name
end
