require 'fcm'
# require 'gcm'

class DemoController < ApplicationController
  layout false

  def index
    # User.create(:email => "test@gmail.com")


    # token = fs5O5HoGKok:APA91bGnj2dKlQ0QfFnCtRU9LvhQyTbWnnw5PFLqzR6emb7r1hTCuZiD6CnLJ7ntu9wts-hZXBSkjH8A1n6bsTHqzmeyznN9pbwO1I88co-GPKsrT5F_X6P3hguA1QcZzZTVWYddXqac
    sendNotification
    render json: User.all


    # render('demo/index')
    # redirect_to(:controller => 'products', :action => :snacks)
  end

  def sendNotification
    deviceTokenEmulator = "fs5O5HoGKok:APA91bGnj2dKlQ0QfFnCtRU9LvhQyTbWnnw5PFLqzR6emb7r1hTCuZiD6CnLJ7ntu9wts-hZXBSkjH8A1n6bsTHqzmeyznN9pbwO1I88co-GPKsrT5F_X6P3hguA1QcZzZTVWYddXqac"
    deviceTokenPixel = "cvF-4BFKeKg:APA91bGsoIWgn9Y4psuYsY0Jf0tJMEq9UCsHPpdOyLIFjud49J4BtHqZB02OcAS6Qc0H85aVuR-VtduZH3VFJn2Ro8eA1Whs6R4X8bQLT4yyY1IqrSDqtwzOC7vbqtixf_q8ZhLM_IdJ"
    deviceToken5X = "cuxGnFB9fVQ:APA91bEBeLrDGdn2be1dGqsZb3_WRNIEkgSd0Tyn3nhuCkFTl6Ba7EYTkzDlwBrIexNddvtoC0QmjtZrM-nyD0niIXn8BkLnpV2uvLIU9Un5uaqBW3KMS0XvbWeXO2tZof7g0xTVYDqr"
    serverKey = "AAAA-Qaz-e8:APA91bHXGHIbaxoAYzSY0fWPsDA3fvNC9x0_Xa1ent9H9jYbYX-EciOOE3RrHGwMaLg_NeZ96hdZmH_H56uSgEFtNwsVZgQpZ03X-O3o3V5PMwHtHPPq37iDmNfvddBa6HDIk9gOWmGg74gHX0wg-snMas5RvFt0LA"

    # Extract params:
    secretCodeParam = params["secretCode"]
    tokenParam = params["token"]
    p "tokenParam = " + tokenParam
    uidParam = params["uid"]

    fcm = FCM.new(serverKey)

    # mobile_tokens = [deviceTokenPixel, deviceTokenEmulator, deviceToken5X]
    mobile_tokens = [tokenParam]
    # options = { :data => { :title => "foobar", :body => "this is a longer message" }, collapse_key: "updated_score" }
    options = { :notification => {
      "title": "Your meal is waiting for you",
      "body": "Secret code: " + secretCodeParam
    } }
    response = fcm.send(mobile_tokens, options)
    p response
    p "Sent"
  end

  def hello
    @array = [1, 2, 3, 4, 5]
    @id = params['id']
    @page = params[:page]

    render('hello')
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def lynda
    redirect_to("http://www.lynda.com")
  end
end
