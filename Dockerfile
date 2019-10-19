FROM osgeo/gdal:ubuntu-full-latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git python3-pip
#    sudo git python-setuptools libvips python3-pip \
#    libvips-dev libtiff5 optipng pngquant
#

#RUN python3 -m pip install pip

# Force python3
#RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

WORKDIR /root

RUN pip3 install numpy

RUN git clone https://github.com/pchynoweth/gdal2mbtiles.git && \
    cd gdal2mbtiles && pip3 install -r requirements.txt && \
    chmod +x gdal2mbtiles.py && mv gdal2mbtiles.py /usr/bin/gdal2mbtiles && \
    mv gui /usr/bin && cd .. && rm -rf gdal2mbtiles

# ENV PROJ_LIB /usr/local/share/proj/
# ENV PROJ_LIB /usr/local/lib/python3.6/dist-packages/pyproj/proj_dir/share/proj/proj.db

