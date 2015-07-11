require 'rails_helper'

describe 'Requests to /api/v1/items.json' do
  let (:url){ '/api/v1/items' }

  before :all do
    @file  = fixture_file_upload("#{Rails.root}/spec/fixtures/files/image.jpg", 'image/jpeg')
  end

  def item_path(item)
    "#{url}/#{item.id}"
  end

  context 'with GET' do
    before :each do
      @items = create_list(:item, 5)
    end

    it 'is return list of items on' do
      get url, {format: :json}

      expect(response).to   be_success
      expect(json.count).to eq 5
    end

    it 'is return one item if request with :id' do
      get item_path(@items[2]), format: :json

      expect(response).to   be_success
      expect(json['id']).to eq @items[2].id
    end
  end

  context 'POST to create item' do
    it 'with file' do
      post url, format: :json, item: { name: 'Milena', picture: @file }

      expect(response).to        be_success
      expect(json['picture']).to be_present
    end

    it 'with name' do
      name = 'Sub-Zero'
      post url, format: :json, item: { name: name }

      expect(response).to     be_success
      expect(json['id']).to   be_present
      expect(json['name']).to eq name
    end
  end

  context 'PUT/PATCH to update item' do
    before :each do
      @items = create_list(:item, 5)
    end

    it 'name' do
      new_name = 'Scorpion'
      patch item_path(@items[3]), format: :json, item: { name: new_name }

      expect(json['id']).to   be_present
      expect(json['name']).to eq new_name
    end

    it 'picture' do
      old_pic = @items[4].picture
      patch item_path(@items[4]), format: :json, item: { picture: @file }

      expect(response).to            be_success
      expect(json['picture']).to_not be_nil
      expect(json['picture']).to_not eq old_pic
    end
  end

  context 'DELETE' do
    before :each do
      @items = create_list(:item, 5)
    end

    it 'is remove item' do
      delete item_path(@items[2]), format: :json

      get url, format: :json
      expect(response).to   be_success
      expect(json.count).to eq 4
    end
  end
end
