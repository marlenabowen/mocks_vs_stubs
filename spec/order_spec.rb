require_relative "test_doubles/MockStore.rb"
require_relative "test_doubles/StoreStub.rb"
require_relative "../order.rb"

describe Order do
  context "Using a mock" do
    describe "place_order" do
      mock_store = MockStore.new()
      order = Order.new()
      it "places an order at a store for a number of shoes" do
        expect(order.place_order(mock_store, 5)).to eq("MockStore.purchase called for 5 shoes")
      end
    end
  end

  context "Using a stub" do
    describe "place_order" do
      store_stub = StoreStub.new(20)
      order = Order.new()
      it "places an order at a store for a number of shoes" do
        order.place_order(store_stub, 5)
        expect(store_stub.shoes_in_stock).to eq(15)
      end
    end
  end
end
