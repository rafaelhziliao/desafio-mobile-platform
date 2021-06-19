Resumo:
* [Requisitos](#Requisitos)
* [Dependências](#dependências)
* [Setup](#setup-inicial)
* [Workflow](#workflow)
* [Branches](#branches)
* [Arquitetura](#arquitetura) - TODO
* [Desafio](#desafio-ios-mobile-platform)
* [Concluído](#concluido)

## Requisitos
* Xcode 12.4
* swift 5.0
* ruby 2.6.6
* iOS 14.4 (iPhone)

## Dependências
* [tuist](https://tuist.io/) - Manutenção de projetos xcode de grande escala
* [bundler](https://bundler.io/) - Versionador Gems do ruby como `cocoapods e fastlane`
* [homebrew](https://brew.sh/index_pt-br) - Gerenciador de pacotes para macOS
* [rbenv](https://github.com/rbenv/rbenv) - Gerenciador de ambientes ruby

## Versão das Dependências
> As versões podem ser encontradas nos arquivos:
* [tuist](https://github.com/rafaelhziliao/desafio-mobile-platform/blob/master/.tuist-version)
* [Gemfile](https://github.com/rafaelhziliao/desafio-mobile-platform/blob/master/Gemfile)
* [Podfile](https://github.com/rafaelhziliao/desafio-mobile-platform/blob/master/Podfile)
* [Ruby](https://github.com/rafaelhziliao/desafio-mobile-platform/blob/master/.ruby-version)

> Não se preocupe com essas instalações o [script](https://github.com/rafaelhziliao/desafio-mobile-platform/blob/master/Scripts/setup.sh) de *Setup Inicial* cuidará disso! 😉

## Setup inicial
1. Clone esse repositório
2. Na raíz projeto rode o script `./Scripts/setup.sh`
3. Rode o projeto 🚀

## Para abrir/rodar após o setup inicial
1. Na raíz do projeto rode o script `./Scripts/up.sh`

## Workflow
Neste projeto, temos a regra de que a branch master deve estar sempre pronto para liberação, o que significa que todo código incorporado a ele deve ser previamente testado e aprovado pelo controle de qualidade.

## Branches

#### Nomeando
Você só pode criar branches seguindo estes padrões:

- feature/[FEATURE_NAME]
- fix/[FEATURE_NAME]
- test/[FEATURE_NAME]
- task/[DESCRIPTION]

#### Organização

Exemplo da hierarquia de branches:

`master` -> `feature/` -> `task/`
or
`master` -> `feature/` -> `test/`
or
`master` -> `feature/` -> `fix/`
or
`master` -> `fix/`
or
`master` -> `test/`

## 💥 DESAFIO iOS MOBILE PLATFORM
Uma das principais responsabilidades do time de *mobile platform* da OLX Brasil é evoluir constantemente a arquitetura dos nossos apps.

Para isto, as pessoas engenheiras da nossa squad precisam dominar as melhores práticas de arquitetura de software (ex: modularização e desacoplamento), assim como garantir a qualidade e segurança.

Desafio:

Faça um fork desse repo e refatore o aplicativo para uma nova arquitetura que garanta:

* Escalabilidade, ou seja, permita que novas features sejam adicionadas sem necessidade de alterar o código existente
* Reuso, ou seja, permitir que partes do app possam ser reaproveitadas em outros apps  
* Testabilidade - Aqui gostaríamos de analisar sua implementação de testes unitários e de UI 

Você poderá ganhar pontos extras se (totalmente opcional):

* Implementar automação de CI/CD
* Habilitar ferramenta de análise estática de seu código  

Dica:

* Como somos um time de plataforma, estamos mais interessados em analisar seus skills em arquitetura, portanto você não precisa evoluir a UI (usabilidade / telas / interface)
* Para que possamos analisar o seu processo de desenvolvimento, não desenvolva tudo em uma única branch ou em um único commit

Boa sorte :)

## ✅ Concluído
* [x] Implementar automação de CI/CD
* [x] Habilitar ferramenta de análise estática de seu código  

