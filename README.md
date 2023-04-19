Set of utilities for GeoServer
----

## Usage
- Pull a GeoServer image:
  ```sh
  docker pull docker.osgeo.org/geoserver:2.22.0
  ```
- Execute the `run.sh` script to run a new container:
  ```sh
  ./run.sh
  ```
  You can modify the following parameters:
  + `VERSION`: GeoServer's image version
  + `EXTENSIONS`: GeoServer's extensions
  + `HOST_DATADIR`: If set, bind host directory `HOST_DATADIR` to container's
    `/opt/geoserver_data`
  + `CORS_ENABLED`: Enable CORS
  + `PORT`: Docker's port host
