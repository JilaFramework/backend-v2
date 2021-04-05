require 'rails_helper'

describe Category do
  describe 'scopes' do
    before do
      @tomorrow = Category.create name: 'tomorrow', position: 2, updated_at: Date.tomorrow
      @yesterday = Category.create name: 'yesterday', position: 1, updated_at: Date.yesterday
    end

    describe :since do
      it 'should filter categories modified before provided date' do
        categories = Category.since Date.today.to_s

        expect(categories).to_not include(@yesterday)
        expect(categories).to include(@tomorrow)
      end
    end
  end
end
