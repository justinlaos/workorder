require 'rails_helper'

RSpec.describe Property, elasticsearch: true, :type => :model do

    it 'should have the right version' do
        es_version = User.__elasticsearch__.client.info['version']['number']
        dotfile = "#{File.open(".elasticsearch-version", &:readline).chomp}"
        expect(dotfile).to eql(es_version)
    end

#   it 'should be indexed' do
#      expect(Property.__elasticsearch__.index_exists?).to be_truthy
#   end
end
