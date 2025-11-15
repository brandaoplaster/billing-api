require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:due_date) }
    it { should validate_presence_of(:payment_method) }
    it { should validate_presence_of(:status) }

    subject { create(:charge) }
    it { should validate_uniqueness_of(:payment_code) }
  end

  describe 'associations' do
    it { should belong_to(:payment_plan) }
    it { should have_many(:payments) }
  end

  describe 'enums' do
    it { should define_enum_for(:payment_method).with_values(boleto: 0, pix: 1) }
    it { should define_enum_for(:status).with_values(issued: 0, paid: 1, canceled: 2) }
  end
end
