document.addEventListener('turbo:load', function() {
  let map

  if(document.getElementById('gmap') !== null){
    function initMap() {
      let address = gon.place.address; 
      
          //マップのインスタンスを変数に代入
            map = new google.maps.Map(document.getElementById('gmap'), {  
              center: gon.geometry,
              zoom: 14
            });

          //マーカーの生成
            let marker = new google.maps.Marker({
              position: gon.geometry,
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
    }
    window.initMap = initMap;
  };
});