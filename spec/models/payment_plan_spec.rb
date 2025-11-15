require 'rails_helper'

RSpec.describe PaymentPlan, type: :model do
  describe 'validations' do
    subject { create(:payment_plan) }
    it { should validate_uniqueness_of(:cost_center_id).scoped_to(:financial_guardian_id) }
  end

    describe 'associations' do
      it { should belong_to(:financial_guardian) }
      it { should belong_to(:cost_center) }
      it { should have_many(:charges) }
    end
end
