# frozen_string_literal: true

RSpec.describe SmartClearsale::Analysis::GetOrder, vcr: { cassette_name: 'get_order' } do
  describe '#order_status' do
    let(:connector) { SmartClearsale::Connector.instance }

    context 'when send order_id for Mount Order Response' do
      it 'send order_id and connector' do
        expect(SmartClearsale::Mount::OrderResponse).to receive(:build_from_update)
          .with(
            connector.do_request('GetOrderStatus', { orderID: '123456' })
          )

        described_class.new('123456').order_status
      end
    end
  end
end
