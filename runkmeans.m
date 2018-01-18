
options = statset('Display','iter','MaxIter',10000);
index = randsample(1:143000,100000);
index = sort(index);
bar = dict(index,:);
[idx,C] = kmeans(bar,500,'Options',options);