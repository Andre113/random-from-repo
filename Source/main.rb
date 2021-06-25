require_relative "Service/members_service"
require 'dotenv'

class Main
	def initialize
		Dotenv.load('./.env')
		@members_service = MembersService.new
		run
	end

	def run
		users_to_ignore = ["mobilepicpay"]
		members = @members_service.members
		selected_user = members.sample
		puts(selected_user.login)
	end
end

@main = Main.new
