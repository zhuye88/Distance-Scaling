function [ Ndis ] = DScale( dis, eta, dim )
n = size(dis, 1);
Ndis = dis./max(max(dis));
Lb = Ndis <= eta;
Rb = Ndis > eta;
den = sum(Lb, 2);
Rate = (den./n).^(1/dim)./eta;
rep = repmat(Rate, [1, n]);
Ndis(Lb) = Ndis(Lb) .* rep(Lb);
rep = rep .* eta;
Ndis(Rb) = (Ndis(Rb) - eta).* (1 - rep(Rb))./(1-eta) + rep(Rb);
end
