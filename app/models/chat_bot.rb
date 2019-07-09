class ChatBot
  def self.send_message
    questions = Question.where("active = true")
    questions.each do |question|
      client = Slack::Web::Client.new
      client.token = question.work_space.token
      users = client.users_list.members.select do |member|
        member.profile.email.present? && member.is_bot == false && member.deleted == false
      end
      choices = question.choices

      if question.type_question = true
        content = {
          channel: question.id_channel,
          text: question.content,
          as_user:  "true",
          attachments: [{
            text: "Bỏ phiếu nha",
            color: "#3AA3E3",
            attachment_type: "default",
            callback_id: "select_status",
            actions: choices.map do |choice|
              {
                name: choice.name,
                text: choice.name,
                type: "button",
                value: choice.id
              }
            end
          }]
        }
        client.chat_postMessage(content)
      else
        users.each do |user|
          content = {
            channel: user.id,
            text: question.content,
            as_user:  "true",
            attachments: [{
              text: "Bỏ phiếu nha",
              color: "#3AA3E3",
              attachment_type: "default",
              callback_id: "select_status",
              actions: choices.map do |choice|
                {
                  name: choice.name,
                  text: choice.name,
                  type: "button",
                  value: choice.id
                }
              end
            }]
          }
          client.chat_postMessage(content)
        end
      end
    end
  end
end