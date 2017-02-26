%Q. 01
%pessoa(cdPessoa,nome,fone)
pessoa(1, obilac, 260088).
pessoa(2, silva, 282677).
pessoa(3, cabral, 260088).
pessoa(4, lobato, 174590).
pessoa(5, mateus, ).

%turma(cdTurma, nome, professor)
turma(a, volei, 4).
turma(b, karate, 4).
turma(c, natacao, 2).

%participante(pessoa, turma)
participante(1, a).
participante(3, a).
participante(1, b).
participante(1, c).
participante(2, c).

%a) ?- findall(CdPessoa-Nome,(pessoa(CdPessoa,Nome,_),turma(_,_,CdPessoa)),L).
%b) ?- findall(CdPessoa-Nome,(pessoa(CdPessoa,Nome,_),participante(CdPessoa,Turma)),L).
%c) ?- findall(CdTurma-Nome, turma(CdTurma,Nome,_),L).
%d) ?- findall(Nome-Turma,(pessoa(CdPessoa,Nome,_),participante(CdPessoa,Turma)),L).
%e) ?- findall(Nome-NomeTurma,(pessoa(CdPessoa,Nome,_),turma(_,NomeTurma,CdPessoa)),L).
%f)
%g) ?- findall(Aluno,participante(Aluno,_),L),sort(L,O),length(O,X).
%h) ?- findall(Prof,turma(_,_,Prof),L),sort(L,O),length(O,X).
%i)

