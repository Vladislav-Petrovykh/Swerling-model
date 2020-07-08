clc; clear all; format long; %close all;


%% ������������� ����� ������ ��� ��������� 

global k_scale;
wo = 16;
Ucc = 1;
k_scale = (2^(wo))/Ucc; % ������������ ���
nbins = 20;

%% ������ � ��������� ���� ���:
hfileL = fopen('outL.txt');
tlineL = fgetl(hfileL);
cstr = 0;
k = 1;
while 1,
    for j = 1:wo,
        if tlineL(j) == 'X' || tlineL(j) == 'U',
            cstr(k,j) = 0;
        else
            cstr(k,j) = str2num(tlineL(j)); % �������� ��� ������� ����� �� ���� X, U
        end;
    end;
    Lbin(k,:) = flip(logical(cstr(k,:))); %% FLIP!
    
	Ldac(k) = DAC(Lbin(k,:), 0);
    tlineL = fgetl(hfileL);
    if ischar(tlineL)   
        k = k + 1;
    else
        N = k;
        break;
    end;
end;
fclose(hfileL);

%% ������ � ��������� ���� ���������:
hfileS = fopen('outS.txt');
tlineS = fgetl(hfileS);
cstr = 0;
k = 1;
while 1,
    for j = 1:wo,
        if tlineS(j) == 'X' || tlineS(j) == 'U',
            cstr(k,j) = 0;
        else
            cstr(k,j) = str2num(tlineS(j)); % �������� ��� ������� ����� �� ���� X, U
        end;
    end;
    Sbin(k,:) = flip(logical(cstr(k,:))); %% FLIP!
	Sdac(k) = DAC(Sbin(k,:), 0);
    tlineS = fgetl(hfileS);
    if ischar(tlineS)   
        k = k + 1;
    else
        N = k;
        break;
    end;
end;
fclose(hfileS);

% figure; hold on;
subplot 221;hold on;
title('�������� I(II)');
plot(Ldac(30:230-1)); grid; 
ylim([0 0.5]);
ylabel('\sigma','rotation', 0); xlabel('n');
subplot 222;hold on;
title('�������� I(II)');
plot(Sdac(30:230-1)); grid; 
ylim([0 0.5]);
ylabel('a','rotation', 0); xlabel('n');

% subplot 223; hold on;
% title('�������� III(IV)');
% plot(Ldac(30:230-1)); grid; ylim([0 0.5]);
% ylabel('\sigma','rotation', 0); xlabel('n');
% subplot 224; hold on;
% title('�������� III(IV)');
% plot(Sdac(30:230-1)); grid; ylim([0 0.5]);
% ylabel('a','rotation', 0); xlabel('n');












% figure; hold on;
% subplot 221; hold on;
% title('�������� I(II)');
% histfit(Ldac(30:end),nbins,'exponential'); grid; xlim([0 1]);
% % legend('����. ���','����. ��� ���');
% legend('H(\sigma)','f_�(\sigma)');
% %hist(Ldac(30:end),nbins); grid; xlim([0 1]);
% subplot 222; hold on;
% title('�������� I(II)');
% histfit(Sdac(30:end),nbins,'rayleigh'); grid; xlim([0 1]);
% % legend('����. ����.','����. ��� ����.');
% legend('H(a)','f_�(a)');
% % hist(Sdac(30:end),nbins); grid; xlim([0 1]);



% subplot 223; hold on;
% title('�������� III(IV)');
% histfit(Ldac(30:end),nbins,'gamma'); grid; xlim([0 1]);
% legend('H(\sigma)','f_�(\sigma)');
% subplot 224; hold on;
% title('�������� III(IV)');
% histfit(Sdac(30:end),nbins,'nakagami'); grid; xlim([0 1]);
% legend('H(a)','f_�(a)');



% mu_L = mean(Ldac(30:end))
% mu_S = mean(Sdac(30:end))