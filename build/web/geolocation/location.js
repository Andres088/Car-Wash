
function findLocation() {
    
    if (navigator.geolocation) {

        navigator.geolocation.getCurrentPosition(
                function (position) {
                    document.getElementById("latitud").value = position.coords.latitude;
                    document.getElementById("longitud").value = position.coords.longitude;
                }
        );
    } 
}

