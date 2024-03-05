require "rails_helper"

RSpec.describe "Actions", type: :request do

before do
    Action.create(title: "First Action", body: "This is the first Action")
    Action.create(title: "Second Action", body: "This is the second Action")
    Action.create(title: "Third Action", body: "This is the third Action")
    Action.create(title: "Fourth Action", body: "This is the fourth Action")
end

scenario "Get all Actions and checks the array length" do

    get "http://localhost:3000/Actions"
    expect(response).to have_http_status(:success)
    Actions = JSON.parse(response.body)
    expect(Actions.length).to eq(4)


end
end