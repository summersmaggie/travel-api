require 'rails_helper'
require 'factory_bot_rails'

describe "put a review route", :type => :request do

  let(:attr) do
    { :author => 'Kanye', :content => 'Hello World', :destination => 'Dubai' }
  end

  before(:each) do
    @review = FactoryBot.create(:review)
    put '/reviews/:id', params: { id: @review.id, review: attr }
    @review.reload
  end

  it { expect(@review.author).to eql attr[:author] }
  it { expect(@review.content).to eql attr[:content] }
  it { expect(@review.destination).to eql attr[:destination] }
end
