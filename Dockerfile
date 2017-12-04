FROM python:3

# Create directory 
RUN mkdir -p /dir/subdir

# Make sure package is up to date
RUN apt-get update

# Install dependencies
RUN apt-get install -y build-essential openssl libssl-dev pkg-config python 

# Install ta-lib-0.4.0
WORKDIR /dir
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
RUN tar -xzf ta-lib-0.4.0-src.tar.gz
WORKDIR /dir/ta-lib
RUN ./configure --prefix=/usr && make && make install
WORKDIR /dir

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://github.com/YunMai-SPS/data602-assignment3.git data602-assignment3
EXPOSE 5000

CMD [ "python", "data602-assignment3/trade_analytics_app.py" ]





