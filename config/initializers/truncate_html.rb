TruncateHtml.configure do |config|
  config.length        = 50
  config.omission      = '...(continued)'
  config.word_boundary = /\S[\.\?\!]/
end