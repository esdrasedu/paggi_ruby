module Kiik
  class Compensation < Resource
    include Kiik::Rest::GetAll

    attr_accessor :status, :received_at, :history_type, :expected_compensation_date,
      :compensated_at, :charge_id, :amount, :aditional_info, :total

    class << self
      def consolidated(customer = nil, start_date = nil, end_date = nil)
        url = customer.nil? ? '' : "#{customer}/"
        url += "consolidated"
        params = []
        params << "start_date=#{start_date.strftime('%Y-%m-%d %H:%M:%S')}" if start_date
        params << "end_date=#{end_date.strftime('%Y-%m-%d %H:%M:%S')}" if end_date
        url += "?#{params.join('&')}" if params.length
        result = request(url, {}, :GET, {})
        raise result if result.kind_of? StandardError
        result.total
      end
    end

    def initialize(attributes = {})
      super(attributes)
    end

    def to_json
      super.merge!(super([
        :status,
        :received_at,
        :history_type,
        :expected_compensation_date,
        :compensated_at,
        :charge_id,
        :amount,
        :aditional_info
      ]))
    end
  end
end
