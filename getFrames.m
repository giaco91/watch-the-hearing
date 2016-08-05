function M = getFrames(magstft,fs,df,t,fmax,fmin,N)
    %Berechne Transformation
    q=(fmax-fmin)/(fs/2-20);%Frequenztransformation
    S=size(magstft);
    magstft=magstft/(max(sum(magstft))+1e-10);%normalisieren
    for i=1:S(2)
        b=0;g=0;r=0; 
        for j=1:S(1)
          x=(j*df*q+fmin)^-1;%transformierte Wellenlänge
          nb=normalvert(x,N(1,1),N(2,1));
          ng=normalvert(x,N(1,2),N(2,2));
          nr=normalvert(x,N(1,3),N(2,3));
          sn=nb+ng+nr+1e-10;
          b=b+magstft(j,i)*nb/sn;
          g=g+magstft(j,i)*ng/sn;
          r=r+magstft(j,i)*nr/sn;
          rgb=[r,g,b];
        end

        Q=sum(magstft(:,i))/(max(rgb)+1e-10);%maxmetrik für intensität ex. I([1,0,0])=I([1,1,0.4])
        rgb=rgb*Q;
        hold on

        plot([t(i),t(i)],[0,fs/2+1],'Color',rgb,'LineWidth',1000/length(t))
        set(gcf,'Color',rgb);
        M(i)=getframe;
    end

end

