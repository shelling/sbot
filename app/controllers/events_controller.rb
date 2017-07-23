class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :stop_soliloquizing

  def create
    client = Slack::Web::Client.new
    client.chat_postMessage(
      channel: params[:event][:channel],
      text: "Hello From SBot",
      as_user: true,
      attachments: [
        {
          text: "Attachment",
          fallback: "No Attachment",
          callback_id: "1",
          color: "#3AA3E3",
          attachment_type: "default",
          actions: [
            {
              name: "First",
              text: "First",
              type: "button",
              value: "First",
            },
            {
              name: "Second",
              text: "Second",
              type: "button",
              value: "Second",
            }
          ]
        }
      ]
    )
    render json: params.slice(:challenge)
  end

  private

  def stop_soliloquizing
    render json: params.slice(:challenge) if params[:event][:user] == "U65TP12CA"
  end
end
