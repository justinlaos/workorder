require 'rails_helper'

RSpec.describe "Properties", type: :request do
    describe "GET /search" do
        before { @property = create(:property, id: 1) }

        it "returns http sucess" do
            gets "/api/v1/search?search_term=#{@property.address}"
    
            expect(response.status).to eq(200)
        end
    end
end