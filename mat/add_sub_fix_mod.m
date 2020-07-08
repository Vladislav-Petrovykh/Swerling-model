%% ===================================================================== %%
%% ������� ��������/��������� � ���������� ������������, ��:
% INPUTS:
% a:        first binary number
% b:        second binary number
% nbw:      number of bits in word
% OUTPUTS:
% c:        sum/sub of numbers 'a' and 'b'
function [c, over_flow] = add_sub_fix_mod(a, b, nbw)
    i = 0; carry_new = 0; over_flow = 0;
%     one_bin = logical(zeros(1,nbw)); one_bin(1) = 1;
    while 1, 
        i = i + 1;
        c(i) = a(i) + b(i); % OR
        carry_old = carry_new; % ������ ������� 
        %  �������� ����� ��������:
        if c(i) > 1,
            c(i) = 0;
            carry_new = 1;
        else
            carry_new = 0;
        end;
        c(i) = c(i) + carry_old; % XOR
        %  �������� ����� ����������� �������� �� ����-�� ����:
        if c(i) > 1,
            c(i) = 0;
            carry_new = 1;
        else
            if carry_new ~= 1, % ���� �� ��������� �������, �� �������������
                carry_new = 0;
            end;
        end;
        %  ������ ������:
        if i == nbw,
           break;
        end;
    end;
return