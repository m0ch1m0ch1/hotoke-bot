module.exports = (robot) ->
  robot.respond /おはよう/i, (msg) ->
   　msg.send "Hello World"

  robot.hear /天気$/, (msg)->
     YAHOO_KEY=process.env.YAHOO_KEY
     message = "武蔵野近辺の天気はhogehogeです"
     image_url = 'https://map.yahooapis.jp/map/V1/static?appid='+YAHOO_KEY+'&lat=35.719674&lon=139.5533187&z=14&width=350&height=350&overlay=type:rainfall|datelabel:ON'
     msg.send "#{image_url}"
