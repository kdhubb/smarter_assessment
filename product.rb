
class Product

  attr_reader :product_name,
              :marketing_copy,
              :product_upc,
              :item_brand_name,
              :product_image_url

  def initialize(attributes)
    @product_name = attributes[:product_name]
    @marketing_copy = attributes[:MARKETING_COPY]
    @product_upc = attributes[:product_upc]
    @item_brand_name = attributes[:item_brand_name]
    @product_image_url = attributes[:product_image_url]
  end
end