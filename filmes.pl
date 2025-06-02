/* filmes.pl - jogo de identificação do gênero de filme.

   inicia com ?- iniciar. */

iniciar :-
    writeln('Escolha um gênero de filme: ação, comédia, romance, terror, ficção científica, drama, animação, aventura, suspense ou musical'),
    hipotese(Genero),
    write('Eu acho que o gênero do filme é: '),
    write(Genero),
    nl,
    undo.


/* Hipóteses a serem testadas */
hipotese(acao) :- acao, !.
hipotese(comedia) :- comedia, !.
hipotese(romance) :- romance, !.
hipotese(terror) :- terror, !.
hipotese(ficcao_cientifica) :- ficcao_cientifica, !.
hipotese(drama) :- drama, !.
hipotese(animacao) :- animacao, !.
hipotese(aventura) :- aventura, !.
hipotese(suspense) :- suspense, !.
hipotese(musical) :- musical, !.
hipotese(desconhecido). /* sem diagnóstico */


/* Regras de identificação dos gêneros de filmes */

/* Ação: enredo complexo e muita ação */
acao :-
    verificar(tem_enredo_complexo),
    verificar(tem_muita_acao).

/* Comédia: enredo complexo e humor */
comedia :-
    verificar(tem_enredo_complexo),
    verificar(tem_humor).

/* Romance: conflito emocional e história de amor */
romance :-
    verificar(tem_conflito_emocional),
    verificar(tem_historia_de_amor).

/* Terror: mistério e cenas assustadoras */
terror :-
    verificar(tem_misterio),
    verificar(tem_cenas_assustadoras).

/* Ficção Científica: enredo complexo, personagens fantasiosos e ficção tecnológica */
ficcao_cientifica :-
    verificar(tem_enredo_complexo),
    verificar(tem_personagens_fantasiosos),
	verificar(tem_ficcao_tecnologica).

/* Drama: enredo complexo e conflito emocional */
drama :-
    verificar(tem_enredo_complexo),
    verificar(tem_conflito_emocional).

/* Animação: personagens fantasiosos, tem humor e é animado */
animacao :-
    verificar(tem_personagens_fantasiosos),
    verificar(tem_humor),
    verificar(e_animado).

/* Aventura: muita ação, personagens fantasiosos e exploração */
aventura :-
    verificar(tem_muita_acao),
    verificar(tem_personagens_fantasiosos),
    verificar(tem_exploracao).

/* Suspense: enredo complexo e mistério */
suspense :-
    verificar(tem_enredo_complexo),
    verificar(tem_misterio).

/* Musical: conflito emocional e música e dança */
musical :-
    verificar(tem_conflito_emocional),
    verificar(tem_musica_e_danca).


/* Como fazer perguntas */
perguntar(Questao) :-
    write('O filme tem o seguinte atributo: '),
    write(Questao),
    write(' (s|n) ? '),
    read(Resposta),
    nl,
    ( (Resposta == sim ; Resposta == s)
      -> assert(yes(Questao))
      ;  assert(no(Questao)), fail ).

:- dynamic yes/1, no/1.


/* Como verificar algo */
verificar(S) :-
    ( yes(S) ->
        true
    ; no(S) ->
        fail
    ; perguntar(S) ).


/* Desfaz todas as afirmações sim / não */
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
