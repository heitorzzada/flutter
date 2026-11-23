# 🍿 CineMelhado Vídeo Locadora & Cine Clube (3º Trimestre)

Projeto mobile desenvolvido em **Flutter** e integrado ao **Cloud Firestore** na branch `melhado`, com tema cinematográfico retrô e contemporâneo de **Locadora de Filmes**.

---

## 👥 Curadoria & Responsável pelo Projeto
- **Curador & Desenvolvedor:** **Lucas Melhado**
- **Atuação:** Gestão do Acervo Cinematográfico & Arquitetura do Aplicativo em Flutter
- **Especialidades do Acervo:** Ficção Científica, Cinema Cult, Clássicos dos Anos 80 e 90, Suspense

---

## 🎬 Identidade Visual Cinemática
- **Tema:** Dark Cinema & Movie Theater (Vermelho Bilheteria `#E50914`, Dourado Pipoca `#FFC107`, Preto Cinema `#141418`)
- **Tipografia:** GoogleFonts **Bebas Neue** (títulos clássicos de cinema), **Montserrat** e **Inter**

---

## 🎯 Estrutura das Telas (3º Trimestre)

1. **`HomePage` (Saguão da Locadora)**:
   - Header temático com estilo marquee de cinema e badges de destaque (*VHS & 4K*, *Avaliação 4.9 ★*, *Pipoca Grátis*).
   - Menu Institucional com acesso à Curadoria & Equipe, Regulamento de Locação e Diagramas de Engenharia.
   - Vitrine de Acesso Rápido às duas coleções do Firestore.

2. **`EquipePage` (Curadoria & Equipe)**:
   - Apresentação de **Lucas Melhado** como gerente de curadoria do acervo e desenvolvedor do app.
   - Chips de gêneros favoritos, atuação na modelagem de dados e regras do Firestore.

3. **`ObjetivosPage` (Regulamento de Locação)**:
   - Diretrizes para aluguel de mídias (prazos de devolução 24h para lançamentos e 3 dias para catálogo).
   - Recomendações de conservação (rebobinamento de fitas VHS e proteção de discos Bluray 4K).
   - Promoção *Quarta-Feira em Dobro* e reservas antecipadas.

4. **`DiagramasPage` (Arquitetura do Sistema)**:
   - Diagrama de Casos de Uso com atores (Cliente, Atendente e Sistema).
   - Diagrama de Classes e mapeamento das coleções do Firestore (`Filme` e `Locacao`).

5. **Entidade 1: Filme (`coleção: filme`)**:
   - **Tela 5 (`cadastro_integrante_page.dart`)**: Formulário com Título do Filme, Gênero Cinematográfico e Ano/Mídia/Classificação. Validação contra campos vazios, timestamp do servidor e SnackBar de confirmação.
   - **Tela 6 (`lista_integrante_page.dart`)**: Listagem em tempo real do acervo com `StreamBuilder` ordenada por data decrescente e botão `+ Cadastrar Filme no Acervo`.

6. **Entidade 2: Locação (`coleção: locacao`)**:
   - **Tela 7 (`cadastro_atividade_page.dart`)**: Formulário de registro com Nome do Sócio/Cliente e Filmes Alugados/Prazos.
   - **Tela 8 (`lista_atividade_page.dart`)**: Quadro de locações em tempo real com cards detalhados e botão `+ Registrar Nova Locação`.

---

## 🚀 Como Executar

```powershell
flutter run -d edge
```
