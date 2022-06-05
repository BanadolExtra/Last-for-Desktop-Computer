function Similarity_mtr = Calculate_Matrices_Similarities(Test, Train)

DimTest = size(Test);
DimTrain = size(Train);
Writer_sim_mat = {};

for i=1:DimTest(1)
   
    for j=1:DimTrain(1)
      % Hamm_Dist = sum(abs(Test(i,1:DimTest(2)-1)-Train(j,1:DimTrain(2)-1)));
       Hamm_Dist = pdist2(Test(i,1:DimTest(2)-1),Train(j,1:DimTrain(2)-1),'chisq');
       Writer_sim_mat{i,j} = {Hamm_Dist, Test(i,DimTest(2)), Train(j,DimTrain(2))};
    end
    
end
Similarity_mtr = Writer_sim_mat; 

