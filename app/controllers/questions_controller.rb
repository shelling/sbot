class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    render json: {
      text: "Payload Response",
      attachments: [
        {
          text: "Attachment",
          fallback: "No Attachment",
          callback_id: "1",
          color: "#3AA3E3",
          attachment_type: "default",
        }
      ]
    }
  end
end
