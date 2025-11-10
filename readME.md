# Sistema Lógico - Entrega Urbana

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
git clone https://github.com/PedroMuci/entrega-urbana-logica.git
