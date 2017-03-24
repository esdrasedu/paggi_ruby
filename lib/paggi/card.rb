module Paggi
  class Card < Resource
    include Paggi::Rest::Create
    include Paggi::Rest::Update

    attr_accessor :customer_id, :name, :number, :month, :year, :cvc, :card_alias, :cvc_check, :default

    class << self

      def check!(params)
        update!(params)
      end

      def check(params)
        update(params)
      end

    end
  end
end
