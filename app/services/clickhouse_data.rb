class ClickhouseData
  def self.q1(params)

  #  countries = `echo 'SELECT DayOfWeek, count(*) AS c FROM datasets.ontime WHERE Year >= 2006 AND
  #    Year <= 2018 GROUP BY DayOfWeek ORDER BY c DESC FORMAT JSON' |
  #    curl 'http://default:123@localhost:8123/' -d @-`
    @query = `echo "SELECT #{params[:user][:event_name]}, count() as c from datasets.ontime
      where Year >= #{params[:user][:date_from]} and Year <= #{params[:user][:date_to]}
      group by #{params[:user][:event_name]}
      order by c desc limit 7 FORMAT JSON" | curl 'http://default:123@localhost:8123/' -d @-`

    data = JSON.parse(@query)['data']
    labels = []
    values = []
    if params[:user][:event_name] == 'DayOfWeek'
      sorted_data = data.sort_by { |k| k['DayOfWeek'] }
      labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
      values = sorted_data.map do |value|
        value['c'].to_i
      end
    else
      labels = data.map{|v| v.first.last }
      values = data.map{|v| v['c'].to_i }
    end
    [labels, values]
  end

  def self.q2
  end

  def self.q3
  end

  def self.q7
  end
end