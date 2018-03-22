module VenuesHelper

  def map_maker(location)
    tmp = ''
    if location.is_a? Array
      location.each do |ven|
        tmp += ven.latitude.to_s + "," + ven.longitude.to_s + '|'
        zoom = '9'
      end
    else
      tmp = "#{location.latitude},#{location.longitude}"
      zoom = '14'
    end

    mt = "https://maps.googleapis.com/maps/api/staticmap?"
    mt += "center=#{tmp}"
    mt += "&zoom=#{zoom}&size=400x400&maptype=roadmap&"
    mt += "markers=color:blue|label:*|#{tmp}"
    mt += "&key=AIzaSyD3QPwG1j85H2nb7_PfJI5phvCrf2QUx4Y"
  end

  def js_map_maker(location)
    
  end
end
