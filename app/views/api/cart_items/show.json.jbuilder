 json.extract! @cart_item, :id, :user_id, :product_id
        json.extract! @cart_item.product, :name, :price
        if @cart_item.product.photos.attached?
            json.photo_url @cart_item.product.photos.map { |product| product.url}
        end