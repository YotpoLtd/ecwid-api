module Ecwid
  module API
    module Product
      def get_products(params = {})
        get('/products', params)
      end
    end
  end
end