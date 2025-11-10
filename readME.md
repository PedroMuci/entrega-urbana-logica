# Sistema Lógico - Entrega Urbana

**Autor:** Pedro Muci <br>
**Disciplina:** Linguagem de Programação e Paradigmas <br>
**Professor:** Ademar Perfoll Junior <br>
**Tema:** Entrega Urbana (peso, volume, zonas, pedágios, janela de entrega)

---

## 🧠 Descrição do Projeto

O **Sistema de Entrega Urbana** foi desenvolvido em **Prolog** e tem como principal objetivo **calcular o custo estimado de uma entrega** com base em múltiplos fatores logísticos. O programa simula um processo de tomada de decisão, semelhante ao que um sistema real de transporte urbano utilizaria para precificar entregas de acordo com parâmetros como peso, volume, número de pedágios, localização e horários críticos.

A proposta é demonstrar o uso prático da **programação lógica** aplicada a um contexto realista, utilizando fatos, regras e inferências para alcançar um resultado. O sistema trabalha com uma base de conhecimento predefinida e executa deduções automáticas a partir das entradas fornecidas pelo usuário.

O cálculo final leva em consideração:

* **Zona de entrega:** cada região (centro, industrial, residencial, rural) possui um custo base distinto.
* **Peso da carga:** cargas mais pesadas aumentam o valor do transporte.
* **Volume:** volumes maiores ocupam mais espaço e impactam o custo.
* **Pedágios:** o número de pedágios adiciona um valor fixo por unidade.
* **Janela crítica:** entregas realizadas fora do horário comercial possuem uma taxa adicional.

A lógica implementada combina esses fatores para determinar um **custo total detalhado**, mostrando como cada componente influencia o resultado final. Essa abordagem reflete a essência da inteligência artificial simbólica, em que o raciocínio é realizado a partir de conhecimento declarativo e regras formais.

---

## ⚙️ Instalação e Execução

### 1. Clonar o repositório

Para obter o código-fonte do projeto, execute o comando abaixo no terminal:

```bash
git clone https://github.com/PedroMuci/entrega-urbana-logica.git
```

### 2. Instalar o SWI-Prolog

Baixe e instale a versão mais recente do interpretador SWI-Prolog no site oficial:
🔗 [https://www.swi-prolog.org/download/stable](https://www.swi-prolog.org/download/stable)

O SWI-Prolog é a ferramenta responsável por interpretar e executar o código lógico, permitindo o uso de predicados, consultas e inferências.

### 3. Estrutura do Projeto

O projeto é organizado em pastas de forma modular, separando a interface, a base de conhecimento e as regras de inferência:

```
C:\entrega-urbana-logica\
 ├── README.md
 └── src\
      ├── main.pl        % ponto de entrada do sistema e menu principal
      ├── kb.pl          % base de conhecimento (fatos e parâmetros)
      ├── rules.pl       % regras de cálculo e inferência lógica
      ├── ui.pl          % interface de interação com o usuário
      └── explain.pl     % explicação e exibição dos resultados
```

### 4. Executar o Sistema

1. Abra o **SWI-Prolog** ou o **terminal integrado** do Visual Studio Code.
2. Acesse o diretório onde o projeto foi clonado:

   ```bash
   cd entrega-urbana-logica
   ```
3. Inicie o interpretador Prolog:

   ```bash
   swipl
   ```
4. Carregue o programa principal:

   ```prolog
   ?- ['src/main.pl'].
   ```
5. Inicie o sistema:

   ```prolog
   ?- start.
   ```
6. O menu principal será exibido:

   * **1** → Calcular custo de entrega
   * **2** → Sair

O sistema guiará o usuário com perguntas interativas e exibirá o resultado final detalhado.

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

O sistema aplica o paradigma da **programação lógica declarativa**, em que o desenvolvedor descreve *o que* deve ser feito, e não *como* fazê-lo. O motor de inferência do Prolog é responsável por resolver as relações entre fatos e regras, produzindo o resultado final com base em deduções automáticas.

* **Fatos (kb.pl):** armazenam informações estáticas, como custos base, valores de pedágios e tempos médios por zona.
* **Regras (rules.pl):** realizam cálculos dinâmicos a partir das entradas fornecidas pelo usuário.
* **Inferência:** o predicado `meta/1` combina as informações e retorna o custo total.
* **Explicação:** o módulo `explain.pl` apresenta o raciocínio seguido e o resultado final.

Essa separação permite fácil manutenção e reutilização das partes do sistema, além de tornar o comportamento previsível e rastreável — algo essencial em sistemas especialistas.

---

## 📚 Exemplo de Regra Simplificada

```prolog
custo_zona(Zona, Valor) :- zona(Zona, Valor).
custo_peso(Peso, Custo) :- Peso =< 100, Custo is Peso * 0.3.
```

Essas regras exemplificam como o sistema transforma conhecimento em inferência prática.
No primeiro caso, o custo é recuperado diretamente da base de conhecimento; no segundo, é calculado com base no peso da carga.

---

## 🧑‍💻 Observações

* O sistema valida as entradas do usuário, impedindo números negativos e respostas inválidas.
* Após o cálculo, o programa exibe o resultado completo e retorna ao menu principal, permitindo novas simulações.

