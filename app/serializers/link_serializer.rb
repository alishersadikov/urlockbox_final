class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :read, :hotread_status, :user_id
end
