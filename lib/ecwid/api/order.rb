module Ecwid
  module API
    module Order
      def get_orders(params = {})
        get('/orders', params)
      end
    end
  end
end