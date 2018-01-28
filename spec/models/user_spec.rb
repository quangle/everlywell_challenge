require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:website_url) }
  it { is_expected.to validate_uniqueness_of(:name) }

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

  describe 'find_related_headings_by_topic' do
    let(:user) { create(:user, name: "quang le") }
    let(:friend_of_user) { create(:user, name: "mike") }
    let(:not_a_friend) { create(:user, name: "rilo") }

    before do
      friend_of_user.friends << user
    end

    context '' do
      it '' do
      end
    end
  end
end
