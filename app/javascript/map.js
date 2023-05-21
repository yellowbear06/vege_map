  document.addEventListener('turbo:load', function() {
    let map
    let geocoder
    let marker = []; // マーカーを複数表示させたいので、配列化
    let infoWindow = []; // 吹き出しを複数表示させたいので、配列化
    const places = gon.places; // コントローラーで定義したインスタンス変数を変数に代入
    
    function initMap(){
      geocoder = new google.maps.Geocoder()
      map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 35.676192, lng: 139.750311},
        zoom: 12
        });

      for (let i = 0; i < places.length; i++) {
        geocoder.geocode( { 'address': places[i].address}, function(results, status) {
          if (status == 'OK') {
              marker[i] = new google.maps.Marker({
                  map: map,
                  position: results[0].geometry.location
              });

              // infoWindow
              infoWindow[i] = new google.maps.InfoWindow({
                content: places[i].name
              });
              // markerがクリックされた時、
              marker[i].addListener("click", function(){
                  // infoWindowを表示
                  infoWindow[i].open(map, marker[i]);
              });
          } else {
              alert('Geocode was not successful for the following reason: ' + status);
          };
        });
      };
    };
    
    function codeAddress(){
        // 入力を取得
        let inputAddress = document.getElementById('address').value;
        // geocodingしたあとmapを移動
    }
    initMap();
    codeAddress();
  });