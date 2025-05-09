function [cp_output] = cyclic_prefix(ifft_output,cplen)
cp(1,:)=ifft_output(end-(cplen-1):end);
ifft_output_transpose(1,:)=ifft_output(:,1); %dimensions error
cp_output(1,:)=[cp(1,:), ifft_output_transpose];
end

