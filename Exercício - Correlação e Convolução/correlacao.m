%% Não funcionando !

function correl = correlacao(x,h)
    [lx, cx] = size(x);
    [lh, ch] = size(h);
    
    lr = lx + 2*lh; % No. de linhas do sinal  + 2*No. de linhas do filtro, para que hajam bordas
    cr = cx + 2*ch; % No. de colunas do sinal + 2*No. de colunas do filtro, para que hajam bordas
    
    x1 = zeros (lr, cr);
    x1(lh+1:lh+lx, ch+1:ch+cr) = x;
    x2 = zeros(lr, cr);
    for i=1:lr-lh
        for j = 1:cr-ch
            aux = double(x1(i:i+lh-1, j:j+ch-1)).* double(h);
            soma = sum(sum(aux));
            x2(i,j) = soma;
        end
    end
    correl = x2(lh+1:lh+lx, ch+1:ch+cx);
    correl = correl/max(max(correl));
    correl = uint8(255 * correl);
end
