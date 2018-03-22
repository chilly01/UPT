module VenuesHelper
  include ActionView::Helpers::JavaScriptHelper

  def map_maker(location)
    api_key = ConfigItem.where(name: 'google_map_api').first.content

    tmp =  ''
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
    mt += "&key=#{api_key}"
  end

  def js_map_maker(location)
    api_key = ConfigItem.where(name: 'google_map_api').first.content
    tmp =  '['
    if location.is_a? Array
      zoom = '9'
      location.each do |ven|
        tmp += "['" + (j ven.name.to_s) + "'," + ven.latitude.to_s + "," + ven.longitude.to_s + '],'
      end
      tmp += "];"
      clat =  location.inject(0.0){ |sum, l| sum+l.latitude} / location.size
      clong =  location.inject(0.0){ |sum, l| sum+l.longitude} / location.size
    else
      safe_name = j location.name
      tmp = "[['#{safe_name}',#{location.latitude},#{location.longitude}]];"
      zoom = '14'
      clat = location.latitude
      clong = location.longitude
    end

    html = '<div id="map" style="width: 500px; height: 400px;"></div>'
    html += '<script async defer src="https://maps.googleapis.com/maps/api/js?'
    html += "key=#{api_key}"
    html += '&callback=initMap"></script>'
    html += ' <script type="text/javascript">'
    html += "var locations = #{tmp}"

    html += "function initMap(){
       var map = new google.maps.Map(document.getElementById('map'), {
         zoom: #{zoom},
         center: new google.maps.LatLng(#{clat}, #{clong}),
         mapTypeId: google.maps.MapTypeId.ROADMAP
       });

       var infowindow = new google.maps.InfoWindow();

       var marker, i;

       for (i = 0; i < locations.length; i++) {
         marker = new google.maps.Marker({
           position: new google.maps.LatLng(locations[i][1], locations[i][2]),
           map: map
         });

         google.maps.event.addListener(marker, 'click', (function(marker, i) {
           return function() {
             infowindow.setContent(locations[i][0]);
             infowindow.open(map, marker);
           }
         })(marker, i));
       }
     }
     </script>"

     html.html_safe
  end
end
