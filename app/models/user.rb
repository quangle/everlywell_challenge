require 'open-uri'

class User < ActiveRecord::Base
  before_save :generate_shortened_url
  after_create :scrape_website_url

  has_many :headings
  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key:  :friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  validates_presence_of :name, :website_url
  validates_uniqueness_of :name
  validates_format_of :website_url, with: URI::regexp(%w(http https))


  def all_friends
    (friends + inverse_friends).uniq
  end

  def not_friends
    all_friend_ids = all_friends.map(&:id) + [self.id]
    User.where('id NOT IN (?)', all_friend_ids)
  end

  def find_related_headings_by_topic(topic)
    # tokenize the topic text like the heading text
    topic_tags = topic.to_s.downcase.gsub('-', ' ').gsub(/[^[:word:]\s]/, '').split.uniq
    all_friend_ids = all_friends.map(&:id) + [self.id]
    #find headings containing all tags from topic belonging to non-friends and not yourself
    Heading.where('tags @> ARRAY[?]::text[] AND user_id NOT IN (?)', topic_tags, all_friend_ids)
  end

  def connection_to(another_user)
    if another_user.all_friends.include?(self)
      "#{self.name} => #{another_user.name}"
    else
      #probably can go deeper to find friends of friends of friends ...
      #this implementation only look for common friend(s) between searcher and expert
      common_friends = another_user.all_friends & self.all_friends
      if common_friends.present?
        "#{self.name} => #{common_friends.map(&:name).join(', ')} => #{another_user.name}"
      else
        "no common friends"
      end
    end
  end

  private

  def generate_shortened_url
    begin
      shortened_website_url = Google::UrlShortener::Url.new(long_url: self.website_url).shorten!
      self.shortened_website_url = shortened_website_url
    rescue
      self.shortened_website_url = nil
    end
  end

  def scrape_website_url
    unless Rails.env.test?
      doc = Nokogiri::HTML(open(website_url))
      headings = doc.css('h1, h2, h3').map(&:text)

      headings.each do |heading|
        # the intention is to tokenize a heading text into tags, basically a primitive imitation of Elasticsearch tokenizers
        tags = heading.to_s.downcase.gsub('-', ' ').gsub(/[^[:word:]\s]/, '').split.uniq
        self.headings.create(original_text: heading, tags: tags)
      end
    end
  end
end
