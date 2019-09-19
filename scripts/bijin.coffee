# 美人時計表示スクリプト
BASE_URL = 'http://www.bijint.com/assets/pict'
PICT_EXT = 'jpg'

# 時・分の値を返す
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

# 時刻を"HH時MM分"の形式で返す
strTime = (date) ->
  time = nowTime(date)
  hh = ('0' + time.hours).slice(-2)
  mm = ('0' + time.minutes).slice(-2)
  return "#{hh}時#{mm}分"

# 時刻を"HHMM"の形式で返す
hhmmTime = (date) ->
  time = nowTime(date)
  hh = ('0' + time.hours).slice(-2)
  mm = ('0' + time.minutes).slice(-2)
  return hh + mm

#module.exports = (robot) ->
  # 以下の文字列があれば自動応答
#  robot.hear /(美人|bijin|時計|tokei|時間|time)/, (msg) ->
#    date = new Date
#    localSignature = 'jp'
#    message = "現在の時刻は#{strTime(date)}です"
#    image_url = "#{BASE_URL}/#{localSignature}/pc/#{hhmmTime(date)}.#{PICT_EXT}"
#    msg.send "#{message}\n#{image_url}"
