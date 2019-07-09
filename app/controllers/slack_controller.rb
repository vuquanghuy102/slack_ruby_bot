require 'json'
require 'uri'
require 'net/http'

class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :check_verification_token

  def self.send_response(response_url, msg)
    url = URI.parse(response_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url)
    request['content-type'] = 'application/json'
    request.body = JSON[msg]
    response = http.request(request)
  end

  def button
  end

  private

  def check_verification_token
    unless params.dig('payload').present? && JSON.parse(params.dig('payload'))['token'] == ENV['SLACK_VERIFICATION_TOKEN']
      render json: { errors: ['user not authorized']}, status: :forbidden and return
    end
  end
end