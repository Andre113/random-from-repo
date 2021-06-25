require 'dotenv'
require 'rest-client'
require 'JSON'
require_relative '../Model/user'

class MembersService
	attr_reader :token, :base_url

	def initialize
		org = ENV['GITHUB_ORG']
		team = ENV['GITHUB_MEMBER_TEAM']
		@base_url = "https://api.github.com/organizations/#{org}/team/#{team}/members"
	end

	def headers
		token = ENV['GITHUB_KEY']
		
		{
			'Accept': 'application/vnd.github.v3+json',
			'Content-type': 'application/json',
			'Authorization': "token #{token}",
			'params': {
				per_page: 100
			}
		}
	end

	def members
		request = RestClient.get(@base_url, headers)
		data = JSON.parse(request.body)
		users = data.map { |item| User.new(item) }
	end
end