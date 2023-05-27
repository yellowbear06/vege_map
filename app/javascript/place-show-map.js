document.addEventListener('turbo:load', function() {
  let map

  if(document.getElementById('gmap') !== null){
    function initMap() {
      let address = gon.place.address; 
      let geocoder = new google.maps.Geocoder();
      
      geocoder.geocode({ address: address }, function(results, status){
        if (status === 'OK' && results[0]){  
          //マップのインスタンスを変数に代入
            map = new google.maps.Map(document.getElementById('gmap'), {  
              center: results[0].geometry.location,
              zoom: 14
            });

          //マーカーの生成
            let marker = new google.maps.Marker({
              position: results[0].geometry.location,
              map: map
            });
          
          //情報ウィンドウの生成
            let contentString =
              '<div>' +
                '<h2>' + gon.place.name + '</h2>' +
                '<p>' + address + '</p>' +
              '</div>';
      
            let infoWindow = new google.maps.InfoWindow({
              content: contentString,
              pixelOffset: new google.maps.Size(0, 5)
            });
      
          //マーカーにリスナーを設定
          marker.addListener('click', function(){
              infoWindow.open(map, marker);
            });
          
        }else{ 
          alert('失敗しました。理由: ' + status);
          return;
        }
      });
    }
    window.initMap = initMap;
  };
});