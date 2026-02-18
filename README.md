📱 miHmo Mobile Automation
🚀 Framework de Automação Mobile – Robot Framework + Appium
***
📌 Sobre o Projeto

O miHmo Mobile Automation é um projeto de automação de testes mobile desenvolvido utilizando:

- ✅ Robot Framework

- 📱 Appium

- 🐍 Python

O objetivo é simular cenários reais de automação de testes mobile, aplicando boas práticas de QA Automation, organização de projeto e tratamento de fluxos dinâmicos.

Este projeto foi criado para fortalecer habilidades em automação mobile e compor portfólio profissional.
***
## 🆕 Versão Atual

### ✅ v1.1.0 – Expansão do Fluxo de Autenticação
- ✔ Automação do fluxo completo de login
- ✔ Automação do fluxo “Primeiro Acesso”
- ✔ Automação de conta já conectada (noReset=true)
- ✔ Tratamento automático de permissões Android
- ✔ Manipulação de teclado (Hide Keyboard)
- ✔ Tratamento de telas condicionais:
  - Tela de Sentimento Diário
  - Modal de Tutorial
- ✔ Validação pós-login (tela inicial contendo "Olá")
- ✔ Estrutura organizada e reutilizável de Keywords
- ✔ Teardown seguro com fechamento protegido da aplicação
***
🧪 Tecnologias Utilizadas
| Tecnologia       | Finalidade               |
| ---------------- | ------------------------ |
| Robot Framework  | Framework de automação   |
| Appium           | Automação mobile Android |
| Python           | Linguagem base           |
| Appium Inspector | Inspeção de elementos    |
| Git & GitHub     | Versionamento            |
| VS Code          | Desenvolvimento          |
***
📁 Estrutura do Projeto
```
mihmo-mobile-automation/
│
├── resources/
│   └── keywords.robot        # Keywords reutilizáveis
│
├── tests/
│   └── login_tests.robot     # Casos de teste
│
├── requirements.txt          # Dependências Python
├── README.md
└── .gitignore
```
***
🧠 Tratamento Inteligente de Cenários

O projeto implementa:

- Uso de `Run Keyword And Return Status` para telas condicionais

- XPath dinâmico para evitar quebra por data/nome

- Loop para permissões Android

- Controle de teclado

- Uso de `Press Keycode 4` para fechar modais

- Estrutura limpa separando testes e lógica
***
▶️ Como Executar o Projeto
1️⃣ Instalar dependências
```pip install -r requirements.txt```

2️⃣ Iniciar o servidor Appium
```appium```

3️⃣ Executar os testes
```python -m robot tests```


Após a execução serão gerados:

`log.html`

`report.html`

`output.xml`
***

👨‍💻 Autor

**Guilherme Radel Uriarte**
QA com foco em automação mobile e arquitetura escalável de testes.

- GitHub: https://github.com/uriartegui

- LinkedIn: https://www.linkedin.com/in/uriartegui19

- Email: guiuriartedev@gmail.com
***
⚠️ Licença

Projeto destinado a fins educacionais e portfólio profissional.
Todos os direitos reservados.
