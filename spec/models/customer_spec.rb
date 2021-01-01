require 'rails_helper'
describe Event,type: :model  do
  describe '#create' do

    it "名前とユーザーidが存在すれば登録できる事" do
      customer = build(:customer)
      expect(customer).to be_valid
    end

    it "名前が空では登録出来ない事" do
      customer = build(:customer, name: "")
      customer.valid?
      expect(customer.errors[:name]).to include("を入力してください")
    end



  end
end