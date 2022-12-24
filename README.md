# bloc_example

Projeto de estudo mostrando o uso do Bloc, especialmente o Cubit para lidar com a interface, injetar dependencias e fornecer controladores.

O programa consiste de uma interface para se colcoar dois nomes e um botão para checar a compatibilidade dos nomes via Api Love, ela responde uma porcentagem de compatibilidade e uma frase motivacional em inglês, então essa frase é passada por uma api de tradução e é exibida a frase já traduzida para o português.

Exemplo do app: <https://lovepercentage.web.app/>

Para o projeto funcionar é preciso injetar uma variável via DartDefine como descrito no [main.dart].

## Injeção de dependencia

A injeção de dependencia do Bloc é uma implementação do Provider que é uma implementação do InheritWidget, ou seja, se trata de criar um Widget injetor na árvore de Widgets com uma função de criação lazy da instância, assim quando qualquer widget abaixo da árvore tenta buscar uma instância de um tipo através do Contexto esse widget construtor cria a instância e a fornece, uma vez criada qualquer outro widget que busque um objeto desse tipo receberá a mesma instância.

Como pode se ver no arquivo [main.dart] através desse método se cria uma árvore de dependencias onde o de baixo pode depender da injeção anterior, ex:

HttpClient -> DataSource -> Repository -> UseCase -> Controlador -> Interface

Assim cada camada de injeção só conhece os contratos abstratos da camada anterior e o UseCase fica como meio de ligação entre a Interface e a camada Domain.

Essa separação também permite a fácil manutenção, uma vez que qualquer implementação pode ser falcimente alterada ou mesmo substituida, como pode ser visto no TranslationApi no [main.dart], sem afetar outras camadas desde que se mantenha fiel ao contrato da interface.

## Verbosidade da injeção

Hoje temos algumas soluções menos verbosas para injeção, seja o Get_it com seu runner para gerar o código necessário, permitindo que seja feitas apenas anotações nas classes implementadas, seja com o Riverpod que através da criação de métodos globais com Providers já fornece a instancia para qualquer local da árvore de widgets com um único widget o ProviderScope, sem a necessidade de outro widget para a criação da instância como o BlocProvider ou o MultiBlocProvider.

Em projetos maiores a opção para reduzir a árvore de injeção utilizando o BlocProvider seria a separação em Widgets especializados, por exemplo um LoveInjection que teria toda a árvore de injeção com todos os use cases dessa funcionalidade dentro de si.

## Os Widgets do Bloc

O Bloc fornece alguns widgets para a interface o BlocBuilder, BlocConsumer e BlocListener em especial, sendo que o consumer seria uma mistura dos outros dois.

O builder seria igual ao Consumer ou Observer de outros controlodaores de estados e o listener fornece um meio para disparar reflexos na alteração dos controladores, geralmente toasts ou modais.

Um pequeno problema na minha opinião é que o BlocBuilder possui o parâmetro bloc no qual é possível fazer o instanciamento de um Bloc ou Cubit sem o prévio BlocProvider, contudo ele é instanciado somente para aquele build, de forma que ele não passa a ser fornecido abaixo na árvore, obrigando que se utilize o BlocProvider para uma árvore que contenha contexto aninhados por outros builders

## O controlador

Nesse estudo só foi utilizado o Cubit, analisando que o Bloc ante sua maior verbosidade só mostra sua verdadeira necessidade em casos de interfaces mais complexas, possivelmente para comunicações em stream em tempo real.

O Cubit é um controlador simples e robusto no padrão do ChangeNotifier onde se possui um Objeto fornecido e métodos que alteram esse Objeto forçando a reconstrução da view através dos Widgets do Bloc.

Apesar de simples e pouco verboso o Cubit é robusto e possui métodos embutido não disponíveis em outros controladores como o MobX, além disso ele não exige build runners e ao trabalhar com Estados de Objetos garante melhor tipagem e controladores mais concisos, próximo ao StateNotifier do Riverpod.

Em relação ao Riverpod existe uma mudança de paradigma, na qual um Controlador não deve conhecer outro controlador, de forma que a view deve fazer essa conexão passando valores entre controladores. Essa abordagem trás benefícios e prejuízos, o benfício primario é que um controlador se torna completamente idependente de outros, suas únicas dependencias são os valores (e possíveis repositórios) passados em seu construtor, nunca tendo acesso a árvore de Widgets diretamente.

Esse isolamento do controlador torna o setup de teste mais conciso e menos sujeito a erros. Contudo essa abordagem joga para a view uma responsabilide a mais de forma que a view se torna mais difícil de ser testada, uma vez que terá que cuidar do repasse de dados entre multiplos controladores.

## Conclusões finais

O Bloc é um ótimo controlador de estado e o Cubit o modernizou retirando a maioria da verbosidade que vinha com o uso das stream, mas mantendo vários de seus métodos robustos, especialmente para observar as alterações de estado, realizar interceptações e rastreabilidade.

Sua injeção purista torna a injeção mais verbosa, possivelmente solucionavel com a adoção do Get_it.

Em relação ao Riverpod o paradigma de um controlador não ter acesso a "árvore de controladores" tem benefícios e prejuízos e precisaria de um projeto maior para uma análise mais detalhada.
