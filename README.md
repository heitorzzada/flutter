# ⚡ André Tattoo Studio App (3º Trimestre)

Projeto desenvolvido com **Flutter** e **Cloud Firestore** customizado com o tema de **Estúdio de Tatuagem** na branch `andre`.

---

## 🖤 Identidade Visual & Tema
- **Tema:** Dark / Gold & Crimson Ink
- **Cores Principais:** Ouro Metálico (`#D4AF37`), Preto Carbono (`#121214`), Carmesim (`#A31D1D`)
- **Tipografia:** GoogleFonts Cinzel, Oswald e Inter

---

## 🎯 Telas e Requisitos do 3º Trimestre

1. **4 Telas Originais do Projeto**:
   - `HomePage`: Menu principal do estúdio com boas-vindas, banner iconográfico e botões.
   - `EquipePage`: Tatuadores da Casa (André Silva, Gabrielli Dolme, Kauany Vieira) e seus estilos autorais.
   - `ObjetivosPage`: Guia de Cuidados com a Tatuagem & Cicatrização (Higiene, Pomada, Sol, Casquinhas, Alimentação).
   - `DiagramasPage`: Casos de Uso e Diagrama de Classes das entidades do estúdio.

2. **Entidade 1: Tatuador (`coleção: tatuador`)**:
   - **Tela 5 - Cadastro de Tatuador**: Nome, Estilo Artístico, Experiência/Contato. Validação de campos vazios, timestamp do servidor e SnackBar de sucesso.
   - **Tela 6 - Lista de Tatuadores**: `StreamBuilder` em tempo real ordenado por data decrescente, cards com estilo e experiência, e botão `+ Cadastrar Tatuador`.

3. **Entidade 2: Agendamento (`coleção: agendamento`)**:
   - **Tela 7 - Cadastro de Agendamento**: Título/Ideia da Tattoo e Detalhes da Sessão. Validação, gravação no Firestore e confirmação.
   - **Tela 8 - Lista de Agendamentos**: `StreamBuilder` em tempo real ordenado por data, cards detalhados e botão `+ Cadastrar Agendamento`.

4. **Navegação**:
   - Tela Inicial ➔ Lista ➔ (+) Cadastro.
