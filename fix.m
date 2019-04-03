%% CleanUP
close all
clear all
clc

%% Load Mesh
[points, type, base, apex, lat, Z, T] = load_vent_mesh('Patient2.vnt');

%% Plot
% use only the first frame
R = squeeze(points(1,:,:));

% convert to cartesian coords
[x,y,z] = pol2cart(T, R, Z);

% plot black markers on each mesh node
figure
surf(x,y,z);
zlen = sum((apex(1,:)-base(1,:)).^2).^0.5;
%%
K = medfilt2(R,[1 6]);
% M = medfilt2(T,[5 1]);
% N = medfilt2(Z,[1 9]);
[x1 y1 z1] = pol2cart(T, K, Z);
% x1 = medfilt2(x1,[5 5]);
% y1 = medfilt2(y1,[5 5]);
figure
surf(x1,y1,z1);