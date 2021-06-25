class User
	attr_reader :id, :login

	def initialize(json)
		@id = json["id"]
		@login = json["login"]
	end
end