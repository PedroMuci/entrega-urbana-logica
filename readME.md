````markdown
# Sistema Especialista - Entrega Urbana

**Autor:** Pedro Muci  
**Disciplina:** Linguagem de Programação e Paradigmas  
**Professor:** Esp. Ademar Perfoll Junior  
**Tema:** Entrega Urbana (peso, volume, zonas, pedágios, janela de entrega)

---

## 🧠 Descrição do Projeto
Este sistema especialista, desenvolvido em **Prolog (SWI-Prolog)**, tem como objetivo calcular o **custo estimado de uma entrega urbana** considerando:

- Zona de entrega (centro, industrial, residencial, rural)
- Peso e volume da carga
- Quantidade de pedágios no trajeto
- Existência de janela crítica de entrega

O programa utiliza uma **base de conhecimento** com fatos sobre zonas e custos,
e aplica **regras de negócio** para deduzir o valor final.  
As inferências são realizadas por meio da consulta `meta/1`, que calcula o custo total e exibe o detalhamento dos fatores que contribuíram para o resultado.

---

## ⚙️ Instalação e Execução

### 1. Clonar o repositório
```bash
git clone https://github.com/usuario/urbano-logico.git
````

> Substitua o link acima pelo endereço real do seu repositório após publicá-lo.

### 2. Instalar o SWI-Prolog

Baixe e instale a versão mais recente do SWI-Prolog em:
🔗 [https://www.swi-prolog.org/download/stable](https://www.swi-prolog.org/download/stable)

### 3. Estrutura do Projeto

```
C:\entrega-urbana-logica\
 ├── README.md
 └── src\
      ├── main.pl        % menu principal
      ├── kb.pl          % base de conhecimento
      ├── rules.pl       % regras e cálculos
      ├── ui.pl          % interface de entrada de dados
      └── explain.pl     % explicações dos resultados
```

### 4. Executar o Sistema

1. Abra o **SWI-Prolog** ou o **terminal** do VS Code.
2. Acesse a pasta do projeto:

   ```bash
   cd entrega-urbana-logica
   ```
3. Inicie o interpretador do Prolog:

   ```bash
   swipl
   ```
4. Carregue o programa principal:

   ```prolog
   ['src/main.pl'].
   ```
5. Execute o sistema:

   ```prolog
   start.
   ```
6. Escolha uma opção no menu:

   * `1` → Calcular custo de entrega
   * `2` → Sair

---

## 🧩 Exemplo de Execução

**Entrada simulada:**

```
Menu:
1) Calcular custo de entrega
> 1
Selecione a zona de entrega:
1) Centro
> 1
Peso da carga (kg): 99
Volume da carga (m3): 12
Numero de pedagios: 12
Janela critica (fora do horario normal)? (s/n): s
```

**Saída esperada:**

```
[Explicacao do Calculo]
- Zona: centro
- Peso (kg): 99
- Volume (m3): 12
- Numero de pedagios: 12
- Janela critica: sim

Componentes do custo:
  - zona: R$ 50.00
  - pedagios: R$ 180.00
  - peso: R$ 29.70
  - volume: R$ 80.00
  - janela: R$ 50.00

Tempo estimado (h): 1.00
Custo total (R$): 389.70
```

---

## 🧮 Funcionamento Lógico

O sistema segue o paradigma da **programação lógica**:

* **Fatos** (em `kb.pl`): definem os valores base para zonas e faixas de custo.
* **Regras** (em `rules.pl`): combinam os fatos conforme as condições observadas.
* **Inferência**: o predicado `meta/1` realiza o cálculo principal com base nas observações.
* **Explicação**: o módulo `explain.pl` mostra como o resultado foi alcançado.

---

## 📚 Exemplo de Regra Simplificada

```prolog
custo_zona(Zona, Valor) :- zona(Zona, Valor).
custo_peso(Peso, Custo) :- Peso =< 100, Custo is Peso * 0.3.
```

Essas regras mostram como o sistema calcula parte do custo total combinando informações da base de conhecimento com a lógica definida.

---

## 🧑‍💻 Observações

* O programa trata entradas inválidas e impede números negativos.
* Após cada consulta, o sistema retorna ao menu principal.

```
```
