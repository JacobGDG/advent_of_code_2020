require 'faraday'

class InputData
  attr_reader :day, :session
  private :day, :session

  BASE_URL = 'https://adventofcode.com/2020/day/'

  def initialize(session: nil, day: 1)
    @day = day
    @session = session
  end

  def fetch_input
    response.body
  end

  private

  def response
    Faraday.get(url, {}, {cookie: "session=#{session}"})
  end

  def url
    "#{BASE_URL}#{day}/input"
  end
end
