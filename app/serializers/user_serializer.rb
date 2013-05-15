class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :full_name
end
