function ej1f
  radio=0.95;
  polos=[ radio*exp(j*pi/4); radio*exp(-j*pi/4); radio*exp(j*pi/4); radio*exp(-j*pi/4) ];
  ceros=[ 0.80*exp(j*pi/6); 0.80*exp(-j*pi/6); 0.80*exp(j*pi/3); 0.80*exp(-j*pi/3) ];

  w = 0:pi/512:pi-pi/512;
  [h] = freqz( poly(ceros), poly(polos), w);
  Gmax=h(129);

  % Genero la señal muestreada a 120Hz
  t=0:1/120:1-1/120;
  x=sin(2*pi*25*t)+sin(2*pi*15*t);
  
  % filtro la señal
  xfilt=filter(poly(ceros)/Gmax,poly(polos),x);
  
  % grafico las señales y sus espectros
  figure
  subplot(2,2,1)
  plot(t,x)
  title('señal original');
  subplot(2,2,2)
  plot(t,xfilt)
  title('señal filtrada');
  subplot(2,2,3)
  stem([0:59 -60:-1], abs(fft(x)) )
  title('espectro señal original');
  subplot(2,2,4)
  stem([0:59 -60:-1], abs(fft(xfilt)) )
  title('espectro señal filtrada');
  
end %function

