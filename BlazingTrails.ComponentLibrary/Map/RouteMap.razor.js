export function initialize(hostElement) {
    // 1. Initialize the map on the hostElement
    hostElement.map = L.map(hostElement).setView([51.505, -0.09], 13);

    // 2. Add the OpenStreetMap tile layer
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
        maxZoom: 18,
        opacity: 0.75
    }).addTo(hostElement.map);

    hostElement.waypoints = [];
    hostElement.lines = [];

    // 3. Handle map clicks to add markers and draw a single continuous line
    hostElement.map.on('click', function (e) {
        let waypoint = L.marker(e.latlng);
        waypoint.addTo(hostElement.map);
        hostElement.waypoints.push(waypoint);

        // Logic Fix: Remove the old line before drawing the updated one
        if (hostElement.lines.length > 0) {
            hostElement.lines.forEach(l => hostElement.map.removeLayer(l));
            hostElement.lines = [];
        }

        let line = L.polyline(hostElement.waypoints.map(m => m.getLatLng()), {
            color: 'var(--brand)'
        }).addTo(hostElement.map);

        hostElement.lines.push(line);
    });
}