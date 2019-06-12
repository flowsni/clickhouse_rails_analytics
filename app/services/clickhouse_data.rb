class ClickhouseData
  def self.q1
    #countries = `echo 'SELECT DayOfWeek, count(*) AS c FROM ontime WHERE Year >= 2000 AND Year <= 2008 GROUP BY DayOfWeek ORDER BY c DESC FORMAT JSONEachRow' | curl 'http://default:123@127.0.0.1/?output_format_json_quote_64bit_integers=1' -d @-`
    countries = `echo 'SELECT DayOfWeek, count(*) AS c FROM datasets.ontime WHERE Year >= 2006 AND
      Year <= 2018 GROUP BY DayOfWeek ORDER BY c DESC FORMAT JSON' |
      curl 'http://default:123@localhost:8123/' -d @-`

      data = JSON.parse(countries)['data']
    sorted_data = data.sort_by { |k| k['DayOfWeek'] }
    days = []
    counts = []
    sorted_data.each do |value|
      counts.push(value['c'].to_i)
    end
    counts
  end

  def self.q2
  end

  def self.q3
  end

  def self.q7
  end
end