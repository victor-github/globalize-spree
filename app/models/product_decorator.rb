Spree::Product.class_eval do
  translates :name, :description
  
  extend Globalize::Migratable
end
