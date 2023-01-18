<h1> Lunch and Learn </h1>

### Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).


### Setup/Installation Guide
- Fork this repository
- Clone your fork
- From the command line, install gems and set up your DB:
  - ```bundle install```

## APIs used
  -  Please follow these links to get your API keys:
    - Edmam: https://developer.edamam.com/edamam-recipe-api
      - Name your API keys from Edamam ```id``` and ```key``` respectfully
    - Youtube: https://developers.google.com/youtube/v3/getting-started
      - Name your API key from Youtube ```Youtube_api_key``` respectfully
    - Unsplash: https://unsplash.com/developers
      - Name your API keys from Upsplash ```unsplash_access_key``` and ```unsplash_secret_key``` respectfully
  - ```bundle exec figaro install```
  - Go to ```config/application.yml```
    - Name your API keys from Edamam ```id``` and ```key``` respectfully
    - Name your API key from Youtube ```Youtube_api_key```
    - Name your API keys from Upsplash ```unsplash_access_key``` and ```unsplash_secret_key``` respectfully
  - Run ```rails db:{create,migrate}```
  - Run the test suite with ```bundle exec rspec.```

### Endpoint Use

- ### GET /api/v1/recipes
  > fetch recipes based on a particular country
  
  | Query Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | country      | string | Optional |
  
    #### Example Response
  ```
    {
      "data": [
          {
              "id": null,
              "type": "recipe",
              "attributes": {
                  "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                  "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                  "country": "thailand",
                  "image": "https://edamam-product-images.s3.amazonaws.com..."
              }
          },
          {
              "id": null,
              "type": "recipe",
              "attributes": {
                  "title": "Sriracha",
                  "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                  "country": "thailand",
                  "image": "https://edamam-product-images.s3.amazonaws.com/."
              }
          },
          {...},
          {...},
          {...},
          {etc},
      ]
  }
  ```
<br>

- ### GET /api/v1/learning_resources
  > fetch learning resources for a particular country

  | Query Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | country      | string | Optional |
  
  #### Example Response
  ```
    {
      "data": {
          "id": null,
          "type": "learning_resource",
          "attributes": {
              "country": "laos",
              "video": {
                  "title": "A Super Quick History of Laos",
                  "youtube_video_id": "uw8hjVqxMXw"
              },
              "images": [
                  {
                      "alt_tag": "standing statue and temples landmark during daytime",
                      "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {
                      "alt_tag": "five brown wooden boats",
                      "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {
                      "alt_tag": "orange temples during daytime",
                      "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {...},
                  {...},
                  {...},
                  {etc},
                ]
          }
      }
  }
  ```
  <br>

- ### POST /api/v1/users
  > registers a user with Lunch and Learn
 
   | Body (JSON)        | Type          |  |
  | ------------- |:-------------:| -----:|
  | name      | string | Required |
  | email      | string | Required |
  
  #### Example Response
  ```
    {
    "data": {
      "type": "user",
      "id": "1",
      "attributes": {
        "name": "Athena Dao",
        "email": "athenadao@bestgirlever.com",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
  ```
  <br>
  
- ### POST /api/v1/favorites
  > adds recipes to a favorited list for a particular user
  
  | Body (JSON)        | Type          |  |
  | ------------- |:-------------:| -----:|
  | api_key      | string | Required |
  | country      | string | Required |
  | recipe_link      | string | Required |
  | recipe_title      | string | Required |
  
  #### Successful Response
  ```
  {
    "success": "Favorite added successfully"
  }
  ```
  <br>

- ### GET /api/v1/favorites
  > fetch favorites of a particular user
  
  | Query Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | api_key      | string | Required |
  
  #### Example Response
  ```
  {
      "data": [
          {
              "id": "1",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Recipe: Egyptian Tomato Soup",
                  "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                  "country": "egypt",
                  "created_at": "2022-11-02T02:17:54.111Z"
              }
          },
          {
              "id": "2",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "country": "thailand",
                  "created_at": "2022-11-07T03:44:08.917Z"
              }
          }
      ]
  }    
  ```
  <br>