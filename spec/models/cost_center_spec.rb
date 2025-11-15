require 'rails_helper'

RSpec.describe CostCenter, type: :model do
  describe 'validations' do
      it { should validate_presence_of(:name) }
      subject { create(:cost_center) }
      it { should validate_uniqueness_of(:name) }
  end

    describe 'associations' do
      it { should have_many(:payment_plans) }
    end
end
