# frozen_string_literal: true

RSpec.describe "Stub feature requests", billy: true do

  it 'should intercept a GET request' do
    stub = proxy.stub('http://example.com/')
    visit 'http://example.com/'
    expect(stub.has_requests?).to be true
    expect(stub.requests).not_to be_empty
  end

  it 'should intercept an AJAX GET request' do
    stub = proxy.stub('http://example.com/')
    visit 'http://example.com/'
    expect(stub.has_requests?).to be true
    expect(stub.requests).not_to be_empty
  end
end