function [ Ndis ] = DScale( dis,eta,dim )

dis=dis./max(max(dis)); 
Ndis=dis-dis;
parfor i=1:size(dis,1)
    Cp=dis(i,:);
    den=sum(Cp<=eta);   % get the density value    
    Rate=(den/size(dis,1)/(eta^dim))^(1/dim);
    Neta=eta*Rate;
    Lb=(Cp<=eta);
    Rb=(Cp>eta);
    Cp(Lb)=Cp(Lb)*Rate;
    Cp(Rb)=(Cp(Rb)-eta).*(1-Neta)./(1-eta)+Neta;     
    Ndis(i,:)=Cp;
end
  

end

