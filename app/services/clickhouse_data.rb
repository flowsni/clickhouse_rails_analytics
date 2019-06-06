class ClickhouseData
  def self.get_data
    hello = `echo 'SELECT * FROM datasets.hits_v1 LIMIT 1 FORMAT JSONEachRow' | curl 'http://default:123@localhost:8123/' -d @-`
    countries = `echo 'SELECT CounterID, count() AS c FROM datasets.hits_v1 GROUP BY CounterID ORDER BY c DESC LIMIT 10 FORMAT JSONEachRow' | curl 'http://default:123@localhost:8123/' -d @-`
    countries
  end
end