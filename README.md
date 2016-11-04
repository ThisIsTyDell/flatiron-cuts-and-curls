# Cuts and Curls Ruby on Rails Application README

## Description
Rails application for hair salons for interaction between clients and stylists. This application allows clients to signup/login to select a stylist, see services offered, book an appointment, and pay for their appointment.

For more detail, check this blog post. http://tydellmiller.com/2016/10/24/introducing_cutsncurls_a_ruby_on_rails_application/

## Walkthrough Video
https://www.youtube.com/watch?v=LUV3sodtUaQ

## Installation
  To install a copy of this project fork and clone this repository.

  In your terminal run `bundle install` to install gems.

  Next run `rake db:migrate` to create the database.

  Finally run `rails s` to start up the server and visit localhost:3000 in your browser.

  This project utilizes 
  - Devise (authorization and authentication)
  - OmniAuth-facebook (logging in through Facebook)
  - Pundit (authorization with roles)
  - rails-admin (admin panel)
  - bootstrap (CSS grid framework)
  - font-awesome (fonts used for theme)

## Requirements
  Payments
  
  This app uses the Stripe API to allow payments, you will need to use your own Stripe development account and API Auth Key in order to use the payment feature. (Optionally, you may use a different payment provider - but this app comes with Stripe built in!)

  OmniAuth Login - Facebook

  You will need to provide your own Facebook App ID and Key to use the Facebook login feature. (Optionally you can extend this application to use other 3rd party providers as well, such as Twitter or Google...)

## Contributions
Contributions to this project are welcome. To contribute to this project, please fork and clone this repository. Then open a pull request once you are ready to submit changes or improvements. 

## License
https://github.com/ThisIsTyDell/flatiron-cuts-and-curls/blob/master/LICENSE

## Theme from Wrapbootstrap
