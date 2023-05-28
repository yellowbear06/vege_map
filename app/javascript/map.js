document.addEventListener('turbo:load', function() {
  let map
  let marker = []; // マーカーを複数表示させたいので、配列化
  let currentInfoWindow
  const infoWindow = [];
  
  if(document.getElementById('map') !== null){
    function initMap(){
      const places = gon.places; // コントローラーで定義したインスタンス変数を変数に代入
      let geocoder = new google.maps.Geocoder()
  
      map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 35.676192, lng: 139.750311},
        zoom: 12
        });
      if (places){
        for (let i = 0; i < places.length; i++) {
          geocoder.geocode( { 'address': places[i].address}, function(results, status) {
            if (status == 'OK' && results[0]) {
                marker[i] = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });

                // infoWindow
                infoWindow[i] = new google.maps.InfoWindow({
                  content: places[i].name
                });

                // markerがクリックされた時、
                marker[i].addListener('click', function(){
                  if (currentInfoWindow) {
                    currentInfoWindow.close();   // 吹き出しが表示されていた場合その吹き出しを閉じる
                  }
                  infoWindow[i].open(map, marker[i]);   // 吹き出しを開く
            
                  // 開いた吹き出しを変数に代入して次回別のマーカーをクリックした際に変数に格納されている吹き出しを閉じる
                  currentInfoWindow = infoWindow[i];
                });
            }else{ 
              alert('失敗しました。理由: ' + status);
              return;
            };
          });
        };
      };
    };
    window.initMap = initMap;
  };
});

