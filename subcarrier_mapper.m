function [ifft_input]= subcarrier_mapper(symbols,num_of_subcarrier,fft_points)
ifft_input=zeros(fft_points,1);
ifft_input(1:(num_of_subcarrier/2),1)=symbols(1,1:(num_of_subcarrier/2));
ifft_input((fft_points-(num_of_subcarrier/2)):end,1)=symbols(1,(num_of_subcarrier/2):72);

end