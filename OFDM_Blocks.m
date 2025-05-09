clc; clear all; 
cplen=32;
%% TX
%number of bits
num_bits=2*72;
%generte bit stream
bit_stream=(rand(1,num_bits)>.5);
%make QPSK Symbols
symbols=QPSK_mapper(bit_stream);
%Mapping subcarrier to be the output of ifft
Mapping_subcarriers=subcarrier_mapper(symbols,72,128)


%ifft
ifft_output=ifft(subcarriers,128);
%cp
add_cp=cyclic_prefix(ifft_output,cplen);

%% RX
cp_after_remove=add_cp(cplen+1:end);
fft_output=fft(cp_after_remove,128);
%DeMapping subcarrier
first=fft_output(1,1:36);
last=fft_output(1,93:end);
Desubcarrier=[first last];
x=Desubcarrier(1,:) .- subcarriers(:,1)
%QPSK Demapping
symbols_de=QPSK_demapper(Desubcarrier);
ber=sum(symbols_de~=bit_stream);

