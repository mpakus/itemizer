require 'rails_helper'

describe Item, type: :model do
  context 'validations' do
    it 'check name is empty' do
      item = build(:item, name: '')
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it 'check name is nil' do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it 'check name limits' do
      item = build(:item, name: 'hello'*300)
      item.valid?
      expect(item.errors[:name]).to include 'is too long (maximum is 255 characters)'
    end

    it 'check picture limits' do
      item = build(:item, picture: 'hello'*300)
      item.valid?
      expect(item.errors[:picture]).to include 'is too long (maximum is 255 characters)'
    end
  end
end
