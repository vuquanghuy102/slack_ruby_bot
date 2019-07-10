class HomeController < ApplicationController
  def index; end

  def successful; end

  def check_auth
    if params['code'].present?
      data = {
        :client_id => ENV['SLACK_CLIENT_ID'],
        :client_secret => ENV['SLACK_CLIENT_SECRET'],
        :code => params['code'],
      }

      url = "https://slack.com/api/oauth.access"

      response = Faraday.post(url) do |req|
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = URI.encode_www_form(data)
      end

      information = JSON.parse(response&.body || "{}")

      work_space_check = WorkSpace.find_by(id_work_space_slack: information['team_id'] )

      if work_space_check.present?
        redirect_to root_path
      else
        work_space = WorkSpace.new
        work_space.name = information['team_name']
        work_space.token = information['bot']['bot_access_token']
        work_space.id_work_space_slack = information['team_id']
        work_space.user_id = current_user.id
        if work_space.save
          redirect_to successful_path
        end
      end
    else
      redirect_to root_path
    end
  end
end
