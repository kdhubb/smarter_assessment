require 'csv' 
require './product.rb'

class ProductFacade 
  def csv_to_products(csv)
    (CSV.open csv, headers: true, header_converters: :symbol).map do |row|
      Product.new(row)
    end
  end

  def stringify_product_info
    string_arr = []
    csv_to_products("/Users/kdhubbard/mod_5/hubbard_smarterxassessment/smarterx_data_sample.csv").each do |product|
      string_arr <<  "product_name: #{product.product_name}" + " marketing_copy: #{product.marketing_copy}"
    end
    string_arr.join(", ")
  end
end

# p ProductFacade.new.stringify_product_info
# p CSV.open "/Users/kdhubbard/mod_5/hubbard_smarterxassessment/smarterx_data_sample.csv", headers: true, header_converters: :symbol
# p File.read("/Users/kdhubbard/mod_5/hubbard_smarterxassessment/smarterx_data_sample.csv")