FROM ubuntu

RUN apt-get update
RUN apt-get install cmake cmake-curses-gui libargtable2-0 libargtable2-dev libsndfile1 libsndfile1-dev libmpg123-0 libmpg123-dev libfftw3-3 libfftw3-dev liblapack-dev libhdf5-serial-dev libhdf5-7 wget build-essential git python -y

RUN git clone https://github.com/Yaafe/Yaafe.git yaafe
RUN cd yaafe && git checkout tags/v0.65
RUN mkdir yaafe/build
RUN cd yaafe/build && cmake ..
RUN cd yaafe/build && make
RUN cd yaafe/build && make install

ENV DEST_DIR /usr/local
ENV YAAFE_PATH $DEST_DIR/yaafe_extensions
ENV PATH $PATH:$DEST_DIR/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$DEST_DIR/lib
ENV PYTHONPATH $PYTHONPATH:$DEST_DIR/python_packages