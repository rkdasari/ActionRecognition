function plotfeatures(F,varargin)
% CDVS_PLOTFEATURES  Plot features of an image.
%
%   cdvs_plotfeatures(F) plots the features F.  Features are attributed
%   image regions. Each column of F is a keypoint with the format
%   [X; Y; S; O; P; d2dS; R; pdf], where
%       X, Y is the center of the keypoint,
%       S is the scale, 
%       O is the orientation (in radians),
%       P is the Peak,
%       d2dS is the second derivative in sigma,
%       R is the ratio of the spatial curvatures,
%       pdf is the relevance of the ALP keypoint.
%   cdvs_plotfeatures(F,'usePeakColor',1) color each keypoint according to P.
%
% See also: cdvs_uncompressed.

if isempty(varargin)
    usePeakColor = 0;
else
    if strcmp('usePeakColor',varargin{1});
        usePeakColor = varargin{2};
    end
end
    
    

% number of vertices drawn for each frame
np = 40;

[D,K] = size(F);

% just points?
if D==2
  plot(F(1,:),F(2,:),'g.');
  return ;
end

r = 2*sqrt(2)*F(3,:);
c = r.*cos(F(4,:));
s = r.*sin(F(4,:));
frames(1:2,:) = F(1:2,:);
frames(3:6,:) = [c ; s ; -s ; c];

% Draw
thr = linspace(0,2*pi,np);

% allx and ally are nan separated lists of the vertices describing the
% boundary of the frames
allx = nan*ones(1, np*K+(K-1));
ally = nan*ones(1, np*K+(K-1));

% allxf and allyf are nan separated lists of the vertices of the
allxf = nan*ones(1, 3*K);
allyf = nan*ones(1, 3*K);

% vertices around a unit circle
Xp = [cos(thr); sin(thr)];

%use peak for color
if usePeakColor
    peak = abs(F(5,:));
    [~, peakIndices] = sort(peak,'ascend');
    figure
    peakMap = colormap(jet(K));
    peakColor=peakMap(peakIndices,:);
    close
end

for k=1:K
    % frame center
    xc = frames(1,k);
    yc = frames(2,k);

    % frame matrix
    A = reshape(frames(3:6,k),2,2);

    % vertices along the boundary
    X = A * Xp;
    X(1,:) = X(1,:) + xc;
    X(2,:) = X(2,:) + yc;

    % store
    allx((k-1)*(np+1) + (1:np)) = X(1,:);
    ally((k-1)*(np+1) + (1:np)) = X(2,:);

    allxf((k-1)*3 + (1:2)) = xc + [0 A(1,2)];
    allyf((k-1)*3 + (1:2)) = yc + [0 A(2,2)];
    
    if usePeakColor
        line([allx((k-1)*(np+1) + (1:np)) nan allxf((k-1)*3 + (1:2))], ...
             [ally((k-1)*(np+1) + (1:np)) nan allyf((k-1)*3 + (1:2))], ...
             'Color',peakColor(k,:),'LineWidth',3);
    else
        line([allx((k-1)*(np+1) + (1:np)) nan allxf((k-1)*3 + (1:2))], ...
             [ally((k-1)*(np+1) + (1:np)) nan allyf((k-1)*3 + (1:2))], ...
             'Color','g','LineWidth',3);
    end

end
