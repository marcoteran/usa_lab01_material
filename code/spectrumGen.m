function [freq,X]=spectrumGen(signal,fs,side)
%--------------------------------------------------
%   signal    --- señal de entrada
%   fs   --- frecuencia de muestreo 
%   side --- transformada de Fourier de un lado (1) o dos lados (2)
%   X    --- magnitud de la transformada de Fourier
%   freq --- eje de frecuencia en Hz 
%--------------------------------------------------
	L=length(Signal);       % Longitud de la señal
	if side == 1
		ts=1/fs;            % Tiempo de muestreo
		tm=L*ts;            % Duración de la señal
		if mod(L,2)==0
		   k=-L/2:L/2-1;            % Numero de muestras even
		else
		   k=-(L-1)/2:(L-1)/2;      % Numero de muestras odd
		end
		freq=k/tm;                  % Vector de frec. discreta
		xs=fftshift(signal);        % Corregir error de fase
		X=fft(xs)/L;                % Normalización de los datos
		X=abs(fftshift(X));         % Centralización de los datos
	else
		X = abs(fftshift(fft(signal)))/L;
		df = fs/L;
		freq = -fs/2+df:df:fs/2;
	end
end