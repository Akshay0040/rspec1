require "rails_helper"

RSpec.describe "Actions", type: :request do

    before do
        Action.create(title: "First Action", body: "This is the first Action")
        Action.create(title: "Second Action", body: "This is the second Action")

    end

    scenario "Sends a delete request to delete a Action" do
                
        delete "http://localhost:3000/Actions/1"
        expect(response).to have_http_status(:success)

        get "http://localhost:3000/Actions"

        expect(response).to have_http_status(:success)
        Actions = JSON.parse(response.body)
        expect(Actions.length).to eq(1)

        

    end

end
