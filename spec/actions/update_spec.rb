require "rails_helper"

RSpec.describe "Actions", type: :request do

    before do 
        Action.create(title: "First Action", body: "This is the first Action")

    end

    scenario "Sends a put request to update a Action" do



        patch "http://localhost:3000/Actions/1", params: {Action: {title: "First Action", body: "I have updated the Action"}}
        expect(response).to have_http_status(:success)
        Action = JSON.parse(response.body)
        expect(Action["title"]).to eq("First Action")
        expect(Action["body"]).to eq("I have updated the Action")

    end
end