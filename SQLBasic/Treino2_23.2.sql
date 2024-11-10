SELECT nome,idade 
from jogadores
WHERE nome IN
(SELECT jogador from premio
where ano = '2023'
and nacionalidade = 'Espanha'
)

    