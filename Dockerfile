FROM python:3

# Numpy
RUN pip install cython
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip install numpy 

# TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install
RUN git clone https://github.com/mrjbq7/ta-lib.git /ta-lib-py && cd ta-lib-py && python setup.py install

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://github.com/YunMai-SPS/data602-assignment3.git data602-assignment3
EXPOSE 5000

CMD [ "python", "data602-assignment3/trade_analytics_app.py" ]




