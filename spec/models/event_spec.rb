require 'rails_helper'
describe Event,type: :model  do
  describe '#create' do

    it "タイトルと開始時間と終了時間とユーザーidが存在すれば登録できる事" do
      event = build(:event)
      expect(event).to be_valid
    end

    it "タイトルが空では登録出来ない事" do
      event = build(:event, title: "")
      event.valid?
      expect(event.errors[:title]).to include("を入力してください")
    end



  end
end