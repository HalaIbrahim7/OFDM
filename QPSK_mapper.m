function [symbol] = QPSK_mapper(bit_stream)
counter=0;
result=zeros(1,length(bit_stream)/2);
output=0;
for iterator=1:2:length (bit_stream)
    counter=counter+1;
    bit_0=bit_stream(iterator);
    bit_1=bit_stream(iterator+1);

    if bit_0==0 && bit_1==0
        output=1+1*j;
    end
    if bit_0==1 && bit_1==0
        output=1-1*j;
    end
    if bit_0==1 && bit_1==1
        output=-1-1*j;
    end
    if bit_0==0 && bit_1==1
        output=-1+1*j;
    end
    result(1,counter)=output;
end
symbol=(1/sqrt(2))*result;
end