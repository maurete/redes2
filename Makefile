all: ejX

ejX for cpp in *.cpp do 
	g++ -lX11 -lm -pthread $cpp -o ${cpp/.cpp/}; done  

