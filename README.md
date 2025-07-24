# 📸 Photo Albums

Aplicativo Flutter que consome a API JSONPlaceholder para exibir álbuns de fotos, seus detalhes, autores e comentários. O projeto é modularizado com `Provider` para gerenciamento de estado e arquitetura em camadas (`core`, `api`, `view_models`, `widgets`, `screens`).

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

---

## 🚀 Funcionalidades

- Listagem de fotos por álbum.
- Exibição de detalhes de uma foto com:
  - Informações do autor.
  - Comentários relacionados.
- Adição de novos comentários dinamicamente.
- Skeleton loader (Shimmer) durante carregamento.
- Scroll suave com estrutura otimizada.

---

## 🧠 Tecnologias e Pacotes

- **Flutter 3.x**
- **Provider** - gerenciamento de estado.
- **Dio** - requisições HTTP.
- **Shimmer** - animação de carregamento esqueleto.
- **JSONPlaceholder** - API gratuita REST fake.

---

## 📂 Estrutura de Pastas

```
lib/
├── models/
│   ├── api/           # Serviços da API (Dio)
│   └── core/          # Modelos: Photo, Album, User, Comment
├── providers/         # ViewModels com Provider
├── screens/           # Telas principais
│   ├── home_screen.dart
│   └── detail_screen.dart
├── widgets/           # Widgets reutilizáveis (cards, loaders, lists)
└── main.dart          # Inicialização do app
```

---

## 📸 Imagens do App

| Tela Inicial | Detalhes da Foto | Comentários |
|--------------|------------------|-------------|
| ![home](assets/screenshots/home.png) | ![detail](assets/screenshots/detail.png) | ![comments](assets/screenshots/comments.png) |

*(adicione suas capturas de tela em `assets/screenshots/`)*

---

## 🛠 Como Rodar Localmente

### Pré-requisitos

- Flutter SDK instalado ([Guia de instalação](https://flutter.dev/docs/get-started/install))
- Android Studio ou VS Code configurado

### Passos

```bash
# Clone o repositório
git clone https://github.com/mayankelwin/photo_albums.git
cd photo_albums

# Instale as dependências
flutter pub get

# Execute o projeto
flutter run
```

---

## 🧪 Teste de Funcionalidades

- ✅ Listagem de fotos por álbum
- ✅ Exibição de autor da foto
- ✅ Listagem de comentários
- ✅ Adição de comentários na interface
- ✅ Loader enquanto carrega
- ✅ Scroll e performance estável

---

## 📌 TODO

- [ ] Paginação das fotos
- [ ] Favoritar fotos localmente
- [ ] Armazenamento offline (com Hive)
- [ ] Suporte a modo escuro

---

## 👨‍💻 Autor

Desenvolvido por [**Mayan Kelwin**](https://github.com/mayankelwin)  
💼 Desenvolvedor Flutter e React Native  
📧 mayankelwin@gmail.com

---

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
