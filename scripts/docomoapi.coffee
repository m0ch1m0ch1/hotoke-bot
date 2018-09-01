module.exports = (robot) ->
  status = {}

  robot.respond /(\S+)/i, (msg) ->

    message = msg.match[1]
    HUBOT_DOCOMO_DIALOGUE_API_KEY = process.env.HUBOT_DOCOMO_DIALOGUE_API_KEY
    HUBOT_DOCOMO_DIALOGUE_APPID   = process.env.HUBOT_DOCOMO_DIALOGUE_APPID
    url = 'https://api.apigw.smt.docomo.ne.jp/naturalChatting/v1/dialogue?APIKEY='+HUBOT_DOCOMO_DIALOGUE_API_KEY
    headers = {'Content-Type':'application/json'}

    d = new Date()
    appSendTime = d.getFullYear() + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + ('0' + d.getDate()).slice(-2) + ' '\
                   + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds()

    request = require('request');

    request.post 
      url: url
      headers: headers
      json: 
        language: "ja-JP"
        botId: "Chatting"
        appId: HUBOT_DOCOMO_DIALOGUE_APPID
        voiceText: message
        clientData: {"option": {"mode":(status['mode'] ? "dialog"),"t":"kansai"}}
        appRecvTime: status['appRecvTime']
        appSendTime: appSendTime
      , (err, response, body) ->

        msg.send body.systemText.expression
        status =
          "appRecvTime": body.serverSendTime
