require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of Cats" do
      #arrange - there needs to be some data in the db for the response
      Cat.create(name: 'Sir Pounce', age: 3, enjoys: 'being the kings cat')

      # act - simulating the HTTP GET request
      get '/cats'

      # assert
      cat_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat_response.length).to eq 1
      first_cat = cat_response.first
      expect(first_cat['name']).to eq 'Sir Pounce'
      expect(first_cat['age']).to eq 3
      expect(first_cat['enjoys']).to eq 'being the kings cat'
    end
  end
  describe "POST /cats" do
    it "creates a new cat" do
      #arrange - build request with perams
      cat_params = {
        cat: {
          name: 'Sylvester',
          age: 50,
          enjoys: "trying to have a tweetie sandwitch"
        }
      }

      # act - make POST request
      post '/cats', params: cat_params

      # assert
      cat = Cat.first
      expect(cat.name).to eq 'Sylvester'
      expect(cat.age).to eq 50
      expect(cat.enjoys).to eq 'trying to have a tweetie sandwitch'
    end 

    it "cannot create a new cat without a name" do
      cat_params = {
        cat: {
          age: 10, 
          enjoys: "catching fish"
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['name']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end
end


