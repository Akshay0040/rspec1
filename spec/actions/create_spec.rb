require "rails_helper"

RSpec.describe "Actions", type: :request do

    scenario "Sends a Action request to create a Action" do

        Action "http://localhost:3000/Actions", params: {Action: {title: "First Action", body: "This is the first Action"}}

        expect(response).to have_http_status(:success)
        Action = JSON.parse(response.body)
        expect(Action["title"]).to eq("First Action")
        expect(Action["body"]).to eq("This is the first Action")

    end
end