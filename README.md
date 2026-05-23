# 📰 CSL Times - Portal de Notícias

![CSL Times Logo](assets/img/logo2.png)

## 📋 Descrição

O **CSL Times** é um portal de notícias moderno e responsivo, desenvolvido em PHP, que permite a publicação, edição e visualização de notícias, além de gerenciamento de usuários, anúncios e categorias. O sistema conta com autenticação, experiência mobile aprimorada, cotação de moedas em tempo real e previsão do tempo.

## ✨ Funcionalidades

- **Cadastro e login de usuários** (com edição de perfil e alteração de senha)
- **Publicação, edição e exclusão de notícias** (com upload de imagem ou URL)
- **Gestão de anúncios** (para anunciantes)
- **Categorias e profissões** (filtro e organização)
- **Cotação de moedas em tempo real** (USD, EUR, BTC, GBP)
- **Previsão do tempo** (São Paulo)
- **Design responsivo** (mobile e desktop)
- **Modo escuro** (dark mode sincronizado)
- **Componentização e código comentado**
- **Saudação personalizada** (com nome do usuário formatado)
- **Mensagens e feedbacks claros para o usuário**

## 🛠️ Tecnologias Utilizadas

- **Backend:** PHP 7.4+, MySQL, PDO, Sessions
- **Frontend:** HTML5, CSS3, JavaScript, Font Awesome, Google Fonts
- **APIs externas:** AwesomeAPI (moedas), OpenWeather (tempo)

## 📁 Estrutura do Projeto

```
ProjetoWeb2/
├── assets/
├── classes/
├── components/
├── config/
├── scripts/
├── uploads/
├── index.php
├── indexUsuario.php
├── portal.php
├── portalAnunciante.php
├── registrar.php
├── alterar.php
├── alterarNoticia.php
├── alterarAnuncio.php
├── deletar.php
├── deletarNoticia.php
├── deletarAnuncio.php
├── cadastrarNoticia.php
├── cadastrarAnuncio.php
├── logout.php
└── README.md
```

## 🚀 Instalação e Configuração (XAMPP)

1. **Inicie Apache e MySQL** no painel do XAMPP.

2. **Importe o banco de dados**
   ```powershell
   Get-Content database\setup.sql -Raw | C:\xampp\mysql\bin\mysql.exe -u root
   ```
   Isso cria o banco `bdcrud` com tabelas e dados de demonstração.

3. **Credenciais do banco** (padrão XAMPP) em `classes/BancoDeDados.php`:
   - Host: `localhost`
   - Banco: `bdcrud`
   - Usuário: `root`
   - Senha: *(vazia)*

4. **Acesse o portal:** [http://localhost/Projetos/CSLTimes/](http://localhost/Projetos/CSLTimes/)

### Usuários de demonstração (senha: `123456`)

| Email | Perfil |
|-------|--------|
| `jornalista@csltimes.local` | Jornalista (publica notícias) |
| `anunciante@csltimes.local` | Anunciante (gerencia anúncios) |
| `leitor@csltimes.local` | Leitor |

## 👥 Como Usar

- **Visitantes:** Visualizam notícias, previsão do tempo e cotações.
- **Usuários logados:** Publicam, editam e excluem notícias, gerenciam perfil e anúncios.
- **Anunciantes:** Gerenciam seus anúncios.
- **Jornalistas:** Publicam notícias.

## 📌 Observações

- O nome do usuário é sempre exibido com iniciais maiúsculas.
- A saudação ("Boa noite") é fixa, mas pode ser personalizada facilmente.
- O menu de moedas/clima é único e responsivo, evitando conflitos de IDs.
- O sistema é modular, facilitando manutenção e expansão.

---
