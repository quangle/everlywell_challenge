class User < ActiveRecord::Base
  before_save :generate_shortened_url

  validates_presence_of :name, :website_url

  validates_format_of :website_url, with: URI::regexp(%w(http https))

  private

  def generate_shortened_url
    begin
      shortened_website_url = Google::UrlShortener::Url.new(long_url: self.website_url).shorten!
      self.shortened_website_url = shortened_website_url
    rescue
      self.shortened_website_url = nil
    end
  end
end
