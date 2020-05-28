# frozen_string_literal: true

RSpec.describe "Stub feature requests", billy: true do

  let(:json_response) do
    {
      "data": [
                {
                  "id":   "1",
                  "name": "Pizza"
                },
                {
                  "id":   "1",
                  "name": "Flowers"
                }
              ]
    }
  end

  it 'should intercept a GET request' do
    stub = proxy.stub('http://example.com/')
    visit 'http://example.com/'
    expect(stub.has_requests?).to be true
    expect(stub.requests).not_to be_empty
  end

  it 'should intercept an AJAX GET request' do
    stub = proxy.stub("http://billy.local/things/").and_return(json: json_response)
    visit '/test'
    expect(page).to have_css("h1", text: "Things")
    expect(page).to have_text("Pizza")
    expect(page).to have_text("Flowers")
    expect(stub.has_requests?).to be true
    expect(stub.requests).not_to be_empty
  end
end