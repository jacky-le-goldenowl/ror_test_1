require 'rails_helper'

RSpec.describe MostFollowerService do
  describe 'get most followers' do
    let!(:user) { create(:user) }

    context 'correct with each try times' do
      it 'return array correct' do
        expect(MostFollowerService.new.call).to eq()
      end
    end
  end
end
