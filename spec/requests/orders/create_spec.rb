require 'rails_helper'

describe 'POST /orders' do
    before { @property = create(:property, id: 1) }

  it 'valid order attributes' do
    post '/api/v1/properties/1/orders', params: {
      order: {
        order_status: "created",
        order_type: "standard",
        property_id: "1",
        description: "fix broken dry wall",
      }
    }

    expect(response.status).to eq(200)

    json = JSON.parse(response.body).deep_symbolize_keys
    
    expect(json[:order_status]).to eq('created')
    expect(json[:order_type]).to eq('standard')
    expect(json[:property_id]).to eq(1)
    expect(json[:description]).to eq('fix broken dry wall')

    expect(Order.count).to eq(1)
    expect(Order.last.description).to eq('fix broken dry wall')
  end

  it 'invalid order attributes' do
    post '/api/v1/properties/1/orders', params: {
        order: {
          order_status: "created",
          order_type: "standard",
          property_id: "1",
        }
    }

    expect(response.status).to eq(400)
    expect(Order.count).to eq(0)
  end
end
