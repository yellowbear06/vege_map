document.addEventListener('turbo:load', function() {
  if (document.getElementById('map') !== null) {
    const places = gon.places;
    const map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 35.676192, lng: 139.750311},
      zoom: 12
    });

    let currentInfoWindow = null;

    const generateInfoWindowContent = (place) => {
      let place_id = place.google_place_id;

      return `
        <a href="/place/${place.id}"><h3>${place.name}</h3></a>
        <a href="https://www.google.com/maps/place/?q=place_id:${place_id}" target="_blank">google mapを開く</a>
      `;
    };

    const openInfoWindow = (infoWindow, marker) => {
      if (currentInfoWindow) {
        currentInfoWindow.close();
      }
      infoWindow.open(map, marker);
      currentInfoWindow = infoWindow;
    };

    if (Array.isArray(places)) {
      places.forEach(place => {
        const marker = new google.maps.Marker({
          map: map,
          position: {lat: place.latitude, lng: place.longitude}
        });

        const content = generateInfoWindowContent(place);

        const infoWindow = new google.maps.InfoWindow({
          content: content
        });

        marker.addListener('click', function() {
          openInfoWindow(infoWindow, marker);
        });
      });
    } else if (places) {
      const marker = new google.maps.Marker({
        map: map,
        position: {lat: places.latitude, lng: places.longitude}
      });

      const content = generateInfoWindowContent(places);

      const infoWindow = new google.maps.InfoWindow({
        content: content
      });

      marker.addListener('click', function() {
        openInfoWindow(infoWindow, marker);
      });
    }
  }
});
