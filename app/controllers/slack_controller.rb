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
    request_data = JSON.parse(params.dig('payload'))
    work_space = WorkSpace.find_by(id_work_space_slack: request_data['team']['id'])
    question = work_space.question.find_by(content: request_data['original_message']['text'])
    client = Slack::Web::Client.new
    client.token = question.work_space.token

    users = client.users_list.members.select do |member|
      member.profile.email.present? && member.is_bot == false && member.deleted == false
    end

    members = users.map do |user|
      {
        name: user.profile.real_name,
        email: user.profile.email
      }
    end

    answer = Answer.new
    answer.question_id = question.id
    answer.choice_id = question.choice.find_by(id: request_data['actions'].first['value']).id
    answer.member_name = members.select{|e| e[:name] == request_data['user']['name'] }.first[:name]
    answer.member_email = members.select{|e| e[:name] == request_data['user']['name'] }.first[:email]

    url = request_data['response_url']
    case request_data['callback_id']
    when 'select_status'
      msg = request_data['original_message']
      msg['text'] = ':heavy_check_mark: Cảm ơn bạn đã bỏ phiếu, chúc bạn làm việc vui vẻ :star-struck:'
      msg['attachments'] = []

      if answer.save
        SlackController.send_response(url, msg)
      end
    end
  end

  private

  def check_verification_token
    unless params.dig('payload').present? && JSON.parse(params.dig('payload'))['token'] == ENV['SLACK_VERIFICATION_TOKEN']
      render json: { errors: ['user not authorized']}, status: :forbidden and return
    end
  end
end