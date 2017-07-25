class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    payload = JSON.parse(params[:payload])
    render json: {
      text: "Answer to #{payload['actions'].first['name']}",
      attachments: [
        {
          text: payload['actions'].first['name'],
          fallback: "No Attachment",
          callback_id: "1",
          color: "#3AA3E3",
          attachment_type: "default",
        }
      ]
    }
  end
end
