function [histogramnorm] = traj_hist(trajs,dict)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[r,c] = size(trajs);
histogramnorm = zeros(1,1000);

for(i = 1:r)
    curval = inf; 
%    curid = 0;
% for(j = 1:10)    
% [val,id] = min(sum((bsxfun(@minus,circshift(trajs(i,:),j), dict)).^2,2));
%   if(curval > val)
%       curval = val;
%       curid = id;
%   end
% end

[val,curid] = min(sum((bsxfun(@minus,trajs(i,:), dict)).^2,2));
histogramnorm(1,curid) = histogramnorm(1,curid) + 1;
end

histogramnorm = double(histogramnorm);
histogramnorm = histogramnorm./r;
end

