#def dictionary
#  short_tweets = {
#  "hello" => "hi",
#  "to" => '2',
#  "two" => '2',
#  "too" => '2',
#  'for' => '4',
#  "four" => '4',
#  "be" => 'b',
#  "you" => 'u',
#  'at' => "@",
#  "and" => "&",
#}
#end
def dictionary
  {
    "hello" => "hi",
    "to" => '2',
    "two" => '2',
    "too" => '2',
    'for' => '4',
    "four" => '4',
    "be" => 'b',
    "you" => 'u',
    'at' => "@",
    "and" => "&",
  }
end

def word_substituter(tweet)
  tweet_array = tweet.split(' ')
  dictionary_words = dictionary.keys
  new_tweet_array = tweet_array.map do |word|
    if dictionary_words.include? word.downcase
      dictionary[word.downcase]
    else
      word
    end
  end
  new_tweet_array.join(' ')
end

def bulk_tweet_shortener(tweets)
  tweets.each { |tweet| puts word_substituter(tweet) }
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if tweet.length > 140
    new_tweet = word_substituter(tweet)
    if new_tweet.length > 140
      "#{new_tweet[0..135]} ..."
    else
      new_tweet
    end
  else
    tweet
  end
end
