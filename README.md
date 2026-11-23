# 📱 Aplicativo Vida Saudável (3º Trimestre)

Projeto desenvolvido com **Flutter** e **Cloud Firestore**, atendendo a todos os requisitos da atividade avaliativa do 3º Trimestre.

---

## 🎯 Requisitos Implementados

1. **4 Telas Originais Mantidas**:
   - `HomePage` (Tela Inicial com esquema de cores `#6D4BBC` / `#551EBB`)
   - `EquipePage` (Apresentação dos integrantes e atribuições)
   - `ObjetivosPage` (Metas de vida saudável: água, exercícios, alimentação, sono e redução de telas)
   - `DiagramasPage` (Diagrama de Casos de Uso e Diagrama de Classes)

2. **Entidade 1: Integrante** (`coleção: integrante`):
   - **Tela 5 - Cadastro de Integrante (`lib/screens/cadastro_integrante_page.dart`)**:
     - Formulário com campos: Nome, Função e Turma.
     - Validação de campos vazios com alerta/SnackBar.
     - Botão Salvar que cria documento no Cloud Firestore com `FieldValue.serverTimestamp()`.
     - Limpa os campos após salvar e exibe SnackBar de sucesso.
   - **Tela 6 - Lista de Integrantes (`lib/screens/lista_integrante_page.dart`)**:
     - `StreamBuilder` com atualização em tempo real (`snapshots()`).
     - Ordenação automática por data de criação (do mais recente para o mais antigo).
     - Exibição em Cards com Data Binding (Nome, Função, Turma e Data).
     - Botão `+ Cadastrar integrante` que navega para o cadastro. Ao salvar e voltar, o registro já aparece na lista.

3. **Entidade 2: Atividade** (`coleção: atividade`):
   - **Tela 7 - Cadastro de Atividade (`lib/screens/cadastro_atividade_page.dart`)**:
     - Formulário com campos: Título da atividade e Descrição.
     - Validação de campos vazios com alerta/SnackBar.
     - Botão Salvar que cria documento no Cloud Firestore com timestamp.
     - Limpa os campos e exibe SnackBar de sucesso.
   - **Tela 8 - Lista de Atividades (`lib/screens/lista_atividade_page.dart`)**:
     - `StreamBuilder` em tempo real.
     - Ordenação decrescente por data.
     - Exibição em Cards estilizados.
     - Botão `+ Cadastrar atividade` levando à tela de cadastro.

4. **Navegação Exigida**:
   - `Tela Inicial` → `Lista` → `(+) Cadastro` (para ambas as entidades).

---

## 🚀 Como Rodar o Projeto Diretamente no Flutter

Abra o terminal na pasta do projeto (`kauanyflutter`):

```bash
# 1. Baixar as dependências
flutter pub get

# 2. Executar no Chrome / Web
flutter run -d chrome

# ou no Edge:
flutter run -d edge

# ou no Windows Desktop:
flutter run -d windows

# ou no emulador Android / celular conectado:
flutter run
```

---

## 🗄️ Estrutura de Pastas Criada

```
kauanyflutter/
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
├── web/
│   ├── index.html
│   └── manifest.json
├── assets/
│   └── images/
├── lib/
│   ├── main.dart
│   ├── firebase_options.dart
│   ├── theme/
│   │   └── app_theme.dart
│   ├── models/
│   │   ├── integrante.dart
│   │   └── atividade.dart
│   ├── services/
│   │   └── firestore_service.dart
│   ├── widgets/
│   │   └── custom_image.dart
│   └── screens/
│       ├── home_page.dart
│       ├── equipe_page.dart
│       ├── objetivos_page.dart
│       ├── diagramas_page.dart
│       ├── lista_integrante_page.dart
│       ├── cadastro_integrante_page.dart
│       ├── lista_atividade_page.dart
│       └── cadastro_atividade_page.dart
```
