module Paggi
  class Charge < Resource
    include Paggi::Rest::Create
    include Paggi::Rest::Cancel
    include Paggi::Rest::Capture

    attr_accessor :customer, :amount, :receipt_email, :destination,
                  :description, :statement_descriptor, :status, :intermediaries,
                  :expected_compensation
  end
end
