% kb.pl
% Base de conhecimento: fatos e parâmetros fixos do domínio de entregas.

% Preço base por zona
preco_base(centro, 50.0).
preco_base(industrial, 40.0).
preco_base(residencial, 35.0).
preco_base(rural, 60.0).

% Valor fixo por pedágio
valor_pedagio(15.0).

% Sobretaxa por peso (em R$/kg)
taxa_peso_por_kg(20, 0.50).      % até 20kg
taxa_peso_por_kg(500, 0.30).     % até 500kg
taxa_peso_por_kg(inf, 0.10).     % acima de 500kg

% Sobretaxa por volume (em R$ fixo)
taxa_volume_por_m3(0.5, 20.0).
taxa_volume_por_m3(2.0, 40.0).
taxa_volume_por_m3(inf, 80.0).

% Custo extra por janela crítica (fora do horário normal)
custo_janela_critica(sim, 50.0).
custo_janela_critica(nao, 0.0).

% Tempo estimado medio por zona (em horas)
tempo_base(centro, 1.0).
tempo_base(industrial, 1.5).
tempo_base(residencial, 1.2).
tempo_base(rural, 2.5).
