require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do
    before do
      @category = FactoryBot.build(:category)
    end
  end
end
