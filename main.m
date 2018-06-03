% this script compares the performance of original DBSCAN clustering algorithms
% with the performance of their ReScale and DScale versions. Parameters for each
% algorithm are tuned to the best. The results are the same as Table 3 of
% the original paper.

clear
clc
load('3L');  % load a dataset
SimMatrix=pdist2(data,data,'minkowski',2); 

%% Original version
%%%%%%%%% DBSCAN
 
bk=4;
be=0.1243;
Tclass=Mdbscan(data,bk,be,SimMatrix);
[ ~,~,~,~,~,~,~,~,Fmeasure,~] = evaluate(class,Tclass');
figure
gscatter(data(:,1),data(:,2),Tclass)
title(['Clustering result with DBSCAN F-measure of ' num2str(Fmeasure)])

%% ReScale version
%%%%%%%%%%% DBSCAN
psi=100;
eta=0.1;
[ ndata ] = ReScale( psi,eta,data); 
 
 nSimMatrix=pdist2(ndata,ndata,'minkowski',2); 

bk=9;
be=0.0653;
Tclass=Mdbscan(data,bk,be,nSimMatrix);
[ ~,~,~,~,~,~,~,~,Fmeasure,~] = evaluate(class,Tclass');
figure
gscatter(data(:,1),data(:,2),Tclass)
title(['Clustering result of ReScale-DBSCAN with F-measure of ' num2str(Fmeasure)])
 
 

%% DScale version
%%%%%%%%%%% DBSCAN
 eta=0.2;
[ Sdis ] = DScale( SimMatrix,eta, size(data,2)); 

bk=10;
be=0.1124;
Tclass=Mdbscan(data,bk,be,Sdis);
[ ~,~,~,~,~,~,~,~,Fmeasure,~] = evaluate(class,Tclass');
figure
gscatter(data(:,1),data(:,2),Tclass)
title(['Clustering result of DScale-DBSCAN with F-measure of ' num2str(Fmeasure)])

 