class User
  attr_accessor :id, :name, :friends # アクセスメソッド

  def initialize(id, name, friends)
    @id = id
    @name = name
    @friends = friends
  end

  def self.getUser(id)
    uri = URI.parse('http://localhost:4000/users/' + id)
    json = Net::HTTP.get(uri)
    userInfo = JSON.parse(json)
    User.new(userInfo['id'], userInfo['name'], userInfo['friends'])
  end
end