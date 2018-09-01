request = require('request');

module.exports = (robot) ->
  robot.hear /(天気|weather)/, (msg)->
    YAHOO_KEY = process.env.YAHOO_KEY
    OWM_KEY   = process.env.OWM_KEY

    config = "id=1856367&APPID=" + OWM_KEY + "&units=metric"
    url = "http://api.openweathermap.org/data/2.5/weather?"+config
    
    request.get
      url: url
      , (err, res, body) ->
      
        json = JSON.parse body
        weatherName = json["weather"][0]["main"]
        temp = json['main']['temp']
        temp_max = json['main']['temp_max']
        temp_min = json['main']['temp_min']
        message = "本日の武蔵野市の天気は「" + weatherName + "」です。\n気温:"+ temp + "℃ 最高気温："  + temp_max+ "℃ 最低気温：" + temp_min+"℃"
        image_url = 'https://map.yahooapis.jp/map/V1/static?appid='+YAHOO_KEY+'&lat=35.719674&lon=139.5533187&z=15&width=350&height=350&overlay=type:rainfall|datelabel:ON'
        msg.send "#{message}\n#{image_url}"
