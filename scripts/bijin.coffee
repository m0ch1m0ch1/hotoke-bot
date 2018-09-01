BASE_URL = 'http://www.bijint.com/assets/pict'
PICT_EXT = 'jpg'

# Dateオブジェクトを受け取り、日本時間の時・分のオブジェクトを返す。
nowTime = (date) ->
  t = date.getUTCHours() + 9
  if t < 24
    h = t
  else
    h = t % 24
  m = date.getMinutes()
  time = {
    hours: h
    minutes: m
  }
  return time

# Dateオブジェクトを受け取り、日本時間の時刻を"HH時MM分"の形式で返す。
strTime = (date) ->
  time = nowTime(date)
  hh = ('0' + time.hours).slice(-2)
  mm = ('0' + time.minutes).slice(-2)
  return "#{hh}時#{mm}分"

# Dateオブジェクトを受け取り、日本時間の時刻を"HHMM"の形式で返す。
hhmmTime = (date) ->
  time = nowTime(date)
  hh = ('0' + time.hours).slice(-2)
  mm = ('0' + time.minutes).slice(-2)
  return hh + mm

module.exports = (robot) ->
  robot.hear /美人$/, (msg) ->
    date = new Date
    localSignature = 'jp'
    message = "現在の時刻は#{strTime(date)}です"
    image_url = "#{BASE_URL}/#{localSignature}/pc/#{hhmmTime(date)}.#{PICT_EXT}"
    msg.send "#{message}\n#{image_url}"
