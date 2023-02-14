module Quotes
  module Scenario
    class AllocationSerializer < SimpleSerializer

      AWARDABLE_TYPES = { line: 'quote_request_line', lot: 'lot' }.freeze

      attributes :id

      attribute(:awardable_id) { has_lot? ? lot_id : line.quote_request_line.id }

      attribute(:awardable_type) { has_lot? ? AWARDABLE_TYPES[:lot] : AWARDABLE_TYPES[:line] }

      attribute :position, unless: -> { has_lot? } do
        line.quote_request_line.position
      end

      attribute :capacity do
        lot_allocations = {}
        line_capacity = ( line.capacity || line.quote_request_line.quantity || 1 )
        if has_lot?
          lot_allocation_key = "#{lot_id}_#{line.quote_response_id}"
          if lot_allocations[lot_allocation_key]
            line_capacity = (line.quote_request_line.quantity || 1) * lot_allocations[lot_allocation_key][:capacity]
          else
            response_lot = line.quote_response.quote_response_lots.find_by(quote_requests_lot_id: lot_id)
            lot_capacity = ( response_lot&.capacity || line.quote_request_line.lot.expected_quantity || 1 )
            line_capacity = (line.quote_request_line.quantity || 1) * lot_capacity
          end
          lot_capacity
        else
          line_capacity
        end
      end

      attribute(:uom) { has_lot? ? I18n.t('quotes.js.lots') : line.uom&.code }

      # attribute :price do
      #   ##TODO
      #   total price of line
      #   multiple price by quantity of lot
      # end

      attribute(:quote_response_id) { line.quote_response_id }

      attribute(:response_line_id, if: -> { !has_lot? } ) { line.id }

      attribute :response_line_ids, if: -> { has_lot? } do
        quote_response_lines = QuoteResponseLine.where( lot_id: lot_id , quote_response_id: line.quote_response_id)
        quote_response_lines&.ids
      end

      attribute(:awarded) { line.quote_awarded? }

      attribute :historical do
        qr = QuoteRequest.find object.quote_scenario&.quote_request_id
        current_responses = qr.current_responses&.index_by(&:id)
        current_responses[line.quote_response_id].present? ? false : true
      end

      has_one :quote_supplier, serializer: QuoteSupplierSerializer do
        qrl = QuoteResponseLine.find object.quote_response_line_id
        qrl.quote_response.quote_supplier
      end

      def self.model_class
        QuoteAllocation
      end

      private

      def line
        @line ||= QuoteResponseLine.find object.quote_response_line_id
      end

      def lot_id
        @lot_id ||= line.quote_request_line.lot_id
      end

      def has_lot?
        lot_id && lot_id != 0
      end
    end
  end
end
