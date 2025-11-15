require 'rails_helper'

RSpec.describe FinancialGuardian, type: :model do
  describe 'validations' do
     it { should validate_presence_of(:name) }
     it { should validate_presence_of(:cpf) }

     subject { create(:financial_guardian) }
     it { should validate_uniqueness_of(:cpf).case_insensitive }
   end

   describe 'associations' do
     it { should have_many(:payment_plans) }
   end
end
