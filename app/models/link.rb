class Link < ApplicationRecord
  belongs_to :user
  has_many :reads

  validates :url, presence: true
  validates :title, presence: true

   def valid_url?(url)
     uri = URI.parse(url)
     uri.is_a?(URI::HTTP) && !uri.host.nil?
   rescue URI::InvalidURIError
     false
   end

   def hotread_status
     all_reads = joins(:reads).order('count DESC').limit(10)
     if allreads.first == self
       "hot"
     elsif all_reads.include?(self)
       "top link"
     end
   end
  # 
  # scope :hot, -> {
  #   select('links.url as url')
  #     .joins('join reads on reads.link_id = links.id')
  #     .where('reads.created_at > ?', Time.now - 1.day)
  #     .group("links.url")
  #     .order('count("reads") DESC').limit(10)
  # }
end
