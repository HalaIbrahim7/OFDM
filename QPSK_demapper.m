function bit_stream = QPSK_demapper(Desubcarrier)

bits=zeros(1,length(Desubcarrier)*2);

Desubcarrier=Desubcarrier*sqrt(2);
contor = 1;
for iterator=1:1:length (Desubcarrier)
    bit_0=real(Desubcarrier(iterator));
    bit_1=imag(Desubcarrier(iterator));
    if(bit_0==1 && bit_1==1)
        bits(contor)=0;
        bits(contor+1)=0;
    end
    if(bit_0==1 && bit_1==-1)
        bits(contor)=1;
        bits(contor+1)=0;
    end
     if(bit_0==-1 && bit_1==-1)
        bits(contor)=1;
        bits(contor+1)=1;
    end
     if(bit_0==-1 && bit_1==-1)
        bits(contor)=0;
        bits(contor+1)=1;
     end 
     contor = contor + 2;
end
bit_stream=bits;
end