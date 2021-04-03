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

      cat_response = JSON.parse(response.body)
      expect(cat_response['name']).to eq 'Sylvester'
      expect(cat_response['age']).to eq 50
      expect(cat_response['enjoys']).to eq 'trying to have a tweetie sandwitch'
      expect(response).to have_http_status(200)
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

    it "cannot create a new cat without a age" do
      cat_params = {
        cat: {
          name: 'Catty', 
          enjoys: "catching fish"
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['age']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new cat without an enjoys description" do
      cat_params = {
        cat: {
          name: 'Catty', 
          age: 5
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['enjoys']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end



  describe "PUT /cats" do
    it "updates a cat" do
      #arrange - create a cat in the db
      cat = Cat.create(name: 'Mittens', age: 1, enjoys: 'long walks on the beach')
      
      #arrange - the request that params are trying to edit on the created cat
      update_cat_params = {
        cat: {
          name: 'Sylvester',
          age: 50,
          enjoys: "trying to have a tweetie sandwitch"
        }
      }

      # act - make PUT request with cat id
      put "/cats/#{cat.id}", params: update_cat_params

      # assert
      update_cat_response = JSON.parse(response.body)
      expect(update_cat_response['name']).to eq 'Sylvester'
      expect(update_cat_response['age']).to eq 50
      expect(update_cat_response['enjoys']).to eq 'trying to have a tweetie sandwitch'
      expect(response).to have_http_status(200)
    end 
  end

end


