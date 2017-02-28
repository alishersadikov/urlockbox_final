class Link < ApplicationRecord
  belongs_to :user
  has_many :reads

  validates :url, presence: true, uniqueness: true
  validates :title, presence: true

   def valid_url?(url)
     uri = URI.parse(url)
     uri.is_a?(URI::HTTP) && !uri.host.nil?
   rescue URI::InvalidURIError
     false
   end

   def hotread_status
     all_reads = Link.joins(:reads).order('count DESC').limit(10)
     if all_reads.first == self
       "top link"
     elsif all_reads.include?(self)
       "hot"
     end
   end
end
