require "rails_helper"

RSpec.describe "Actions", type: :request do

before do
    Action.create(title: "First Action", body: "This is the first Action")
    Action.create(title: "Second Action", body: "This is the second Action")
    Action.create(title: "Third Action", body: "This is the third Action")
    Action.create(title: "Fourth Action", body: "This is the fourth Action")
end

    scenario "gets the first Action" do 

        get "http://localhost:3000/Actions/1"

        expect(response).to have_http_status(:success)
        Action = JSON.parse(response.body)
        expect(Action["title"]).to eq("First Action")
        expect(Action["body"]).to eq("This is the first Action")

    end

    scenario "gets the second Action" do 

        get "http://localhost:3000/Actions/2"

        expect(response).to have_http_status(:success)
        Action = JSON.parse(response.body)
        expect(Action["title"]).to eq("Second Action")
        expect(Action["body"]).to eq("This is the second Action")

    end
end
