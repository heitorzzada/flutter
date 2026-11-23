# ✒️ André de Oliveira Tattoo Studio App (3º Trimestre)

Projeto mobile desenvolvido em **Flutter** integrado em tempo real com **Cloud Firestore** na branch `andre`, com design autoral exclusivo de um estúdio de tatuagem de alto padrão.

---

## 👤 Responsável pelo Projeto & Estúdio
- **Artista & Desenvolvedor:** **André de Oliveira**
- **Função:** Tatuador Residente, Fundador & Desenvolvedor Flutter
- **Especialidades:** Blackwork, Geométrico, Fineline, Pontilhismo
- **Contato:** `@andre.oliveira.tattoo`

---

## 🖤 Identidade Visual Exclusiva
- **Tema:** Dark Atelier & Gold Foil (Preto Carbono `#121214`, Dourado Metálico `#D4AF37`, Carmesim `#A31D1D`)
- **Tipografia:** GoogleFonts **Cinzel** (titulares e logos), **Oswald** (botões e tags), **Inter** (leitura limpa)
- **Componentes:** Cards com gradientes sutis, badges de biossegurança e feedback háptico/visual.

---

## 🎯 Estrutura das Telas (3º Trimestre)

1. **`HomePage` (Atelier Principal)**:
   - Header customizado com estilo de estúdio premium e selos de biossegurança (100% descartável).
   - Menu Institucional com acesso à tela do Artista, Manual de Cicatrização e Diagramas.
   - Vitrine de Acesso Rápido às duas coleções do Firestore.

2. **`EquipePage` (Sobre o Artista)**:
   - Apresentação individual e detalhada de **André de Oliveira** como artista residente e desenvolvedor único do projeto.
   - Tags de especialidades, biografia e descrição de sua atuação no app e nas artes autorais.

3. **`ObjetivosPage` (Manual de Cicatrização)**:
   - Protocolo em 3 fases (Fase 1: Primeiras 48h, Fase 2: Do 3º ao 14º dia, Fase 3: A partir do 15º dia).
   - Orientações de assepsia, hidratação, proteção solar e alimentação anti-inflamatória.

4. **`DiagramasPage` (Arquitetura do Sistema)**:
   - Diagrama de Casos de Uso com atores e fluxos de agendamento.
   - Diagrama de Classes e modelagem dos documentos das coleções Firestore (`Tatuador` e `Agendamento`).

5. **Entidade 1: Tatuador (`coleção: tatuador`)**:
   - **Tela 5 (`cadastro_integrante_page.dart`)**: Formulário com Nome, Estilo Artístico e Experiência/Contato. Validação de campos vazios, timestamp do servidor e SnackBar dourada de sucesso.
   - **Tela 6 (`lista_integrante_page.dart`)**: Listagem em tempo real com `StreamBuilder` ordenada por data decrescente e botão `+ Cadastrar Tatuador`.

6. **Entidade 2: Agendamento (`coleção: agendamento`)**:
   - **Tela 7 (`cadastro_atividade_page.dart`)**: Formulário de agendamento com Ideia/Título da tattoo e Detalhes da sessão.
   - **Tela 8 (`lista_atividade_page.dart`)**: Quadro de agendamentos em tempo real com cards detalhados e botão `+ Cadastrar Agendamento`.

---

## 🚀 Como Executar

```powershell
flutter run -d edge
```
