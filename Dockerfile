FROM osgeo/gdal:ubuntu-full-latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git python3-pip

COPY . gdal2mbtiles

RUN cd gdal2mbtiles && pip3 install -r requirements.txt && \
    chmod +x gdal2mbtiles.py && mv gdal2mbtiles.py /usr/bin/gdal2mbtiles && \
    mv gui /usr/bin && cd .. && rm -rf gdal2mbtiles

