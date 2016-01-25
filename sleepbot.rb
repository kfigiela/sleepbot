#!/usr/bin/env ruby
require "bundler/setup"
require "slack"

Slack.configure do |config|
  config.token = ENV['SLACK_TOKEN']
end

channel = ENV['SLACK_CHANNEL']

gifs = ["http://giphy.com/gifs/bird-owl-qISaMW1xwmvNS", "http://giphy.com/gifs/NBFWQBHEEj1bG", "http://giphy.com/gifs/jWOLrt5JSNyXS", "http://giphy.com/gifs/lol-owl-kX5tZqZWyKxMI", "http://giphy.com/gifs/owl-harry-potter-scared-67gBbGOFxv6yQ", "http://giphy.com/gifs/cute-adorable-owl-WaEDmi1vk4vFm", "http://giphy.com/gifs/uRPaR4nAKn2HC", "http://giphy.com/gifs/lol-owl-cKCKIoe5i8m7S", "http://giphy.com/gifs/love-RyxeaK6CrfP0Y", "http://giphy.com/gifs/great-horned-owl-kewCD3ucGAwak", "http://giphy.com/gifs/c5Rlke9hRLoDS", "http://giphy.com/gifs/srs-tpyLzzj8Ruc0M", "http://giphy.com/gifs/cat-love-u6z0UkJQnnWzC", "http://giphy.com/gifs/itcuddles-vine-gifs-zltRJnJ2Wesg0", "http://giphy.com/gifs/cheezburger-lol-deal-with-it-owl-ytwDCONFN7RZntjD5m", "http://giphy.com/gifs/owl-peek-iKufnbkSIcliM", "http://giphy.com/gifs/overcast-gif-xwy9AbBlXlIFW", "http://giphy.com/gifs/owl-wMrDQG1xeCPe", "http://giphy.com/gifs/owl-owls-animation-Yl8cYI66NzOuY", "http://giphy.com/gifs/owl-disney-cartoon-PF8tgP1N94kj6", "http://giphy.com/gifs/owl-florida-grill-ErLimaUL0blbW", "http://giphy.com/gifs/broad-city-abbi-abrams-broadcityedit-bKThMhaYM9EBO", "http://giphy.com/gifs/owl-funny-MI9yXvAW2JpUk", "http://giphy.com/gifs/cheezburger-owl-cute-HxO8Qv44PrO3C", "http://giphy.com/gifs/owl-grammar-family-guy-JEIRAmTTfUgYE"]

# Slack.auth_test
cl       = Slack.client
users    = cl.users_list presence: true
present = users["members"].select { |u| u["presence"] == "active" }.map {|u| "@" + u["name"]}

if present.length > 0
  msg = "#{present.join(", ")} – jest #{Time.now.strftime "%H:%M"}, pora spać!\n#{gifs.sample}"
  cl.chat_postMessage channel: channel, text: msg, username: "SleepBot", icon_emoji: ":sleeping:"
end


