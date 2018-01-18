function [xll,yll,xlr,ylr,xmp,ymp,xul,yul,xur,yur] = bbox_coordinates(bbox)

%bbox
%BBOX_COORDINATES Summary of this function goes here
%   Detailed explanation goes here
    xll = bbox(1);
    yll = bbox(2);
    xlr = bbox(1) + bbox(3);
    ylr = bbox(2);
    xmp = bbox(1) + (bbox(3))/2;
    ymp = bbox(2) + (bbox(4))/2;
    xul = bbox(1);
    yul = bbox(2) + bbox(4);
    xur = bbox(1) + bbox(3);
    yur = bbox(2) + bbox(4);
end

