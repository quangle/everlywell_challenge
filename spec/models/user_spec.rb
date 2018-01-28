require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:website_url) }

  describe 'website_url validator' do
    let(:user) { build(:user, website_url: url) }
    context 'website_url is a valid URL' do
      let(:url) { Faker::Internet.url }
      it 'user is created successfully' do
        expect(user.save).to eq true
      end
    end

    context 'website_url is not valid URL' do
      let(:url) { 'http;//not-a-url' }
      it 'user is not created' do
        expect(user.save).to eq false
      end
    end
  end
end
