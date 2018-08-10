# Van Spots
API-first application to allow users to log and view spots to wild camp in vans.

## Requirements

* ruby 2.5.1p57 
* Rails 5.2.1

## Installing

Use bundle to install

Generate Application Credentials --not sure if needed

$ EDITOR="atom --wait" rails credentials:edit

Create Database

$ rails db:migrate

$ rails db:test:prepare

$ rails db:seed

Use rspec to test

## Running Locally

$ rails s

New terminal window

$ http :3000/auth/login email=test@email.com password=testpass

(requires httpie)

$ http :3000/spots Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MzM5Njk3NjF9.wJnoMyLjeszY8sb0R4t86xdAjyeP1-t-gW5TKyfq0H8'

(note authorization spelt with a z)

$ http :3000/spots/2/ratings Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MzM5Njk3NjF9.wJnoMyLjeszY8sb0R4t86xdAjyeP1-t-gW5TKyfq0H8'
