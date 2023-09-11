# data602-3-docker

tips for installing TA-lib:

Download ta-lib-0.4.0-src.tar.gz and put it to the directory where you are planning to install talib (I use "~/talib"), open bash and skip to the directory that you just put the downloaded file cd ~/talib and; (I put it in /Users/ymai/)

1. tar -xzf ta-lib-0.4.0-src.tar.gz
2. rm ta-lib-0.4.0-src.tar.gz
3. cd ta-lib/
4. ./configure --prefix=/Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/ta-lib
5. make
6. sudo make install
add necessary directories to the path. To do that;
Edit .bashrc in your home directory and add the following line: please remember to change PREFIX with your path to talib (~/ta-lib/)

export TA_LIBRARY_PATH=$PREFIX/lib
export TA_INCLUDE_PATH=$PREFIX/include

(export TA_LIBRARY_PATH=~/ta-lib/lib
export TA_INCLUDE_PATH=~/ta-lib/include)
pip install TA-Lib
