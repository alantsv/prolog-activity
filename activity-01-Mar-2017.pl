% Univeridade Federal do Pará
% Autores: Alan Tony Souza Veloso 		- 201504940009
%	   Leonardo Christian Ferreira da Costa - 201504940019
% Professor: Eloi Favacho
% Diciplina: Programação em Lógica

%Q 01: Codificar as tabela abaixo no Prolog e fazer as consultas abaixo: 
%pessoa(cdPessoa,nome,fone)
 pessoa(1,obilac,260088).
 pessoa(2,silva,282677).
 pessoa(3,cabral,260088).
 pessoa(4,lobato,174590).
 pessoa(5,mateus,-).

%turma(cdTurma, nome, professor)
 turma(a,volei,4).
 turma(b,karate,4).
 turma(c,natacao,2).

%participante(pessoa, turma)
 participante(1,a).
 participante(3,a).
 participante(1,b).
 participante(1,c).
 participante(2,c).

% c.1) Mostre só os professores, com código;
% ?- findall(CdPessoa-Nome,(pessoa(CdPessoa,Nome,_),turma(_,_,CdPessoa)),L), sort(L,O).

% c.2) Mostre só os alunos, com código
% ?- findall(CdPessoa-Nome,(pessoa(CdPessoa,Nome,_),participante(CdPessoa,Turma)),L), sort(L,O).

% c.3) Mostre só as turmas, com código
% ?- findall(CdTurma-Nome, turma(CdTurma,Nome,_),L).

% c.4) Mostre os alunos de cada turma (pessoa+participante)
% ?- findall(Nome-Turma,(pessoa(CdPessoa,Nome,_),participante(CdPessoa,Turma)),L).

% c.5) Mostre o professor de cada turma (Pessoa+turma)
% ?- findall(Nome+NomeTurma,(pessoa(CdPessoa,Nome,_),turma(_,NomeTurma,CdPessoa)),L).

% c.6) Fazer um join das três tabelas, listando toda a informação: 
% todos os campos como uma folha de freqüência de uma turma: 
% nome e código da turma, nome e código do professor, 
% nome e código e fone de cada aluno (como abaixo). 
% ?- findall(CdTurma|NmTurma|CdProf|Prof|CdAluno|Aluno|Fone,(turma(CdTurma,NmTurma,CdProf),pessoa(CdProf,Prof,_),participante(CdAluno,CdTurma),pessoa(CdAluno,Aluno,Fone)),L), sort(L,O).

% c.7) Quantos alunos existem?
% ?- findall(Aluno,participante(Aluno,_),L),sort(L,O),length(O,X).

% c.8) Quantos professores existem? 
% ?- findall(Prof,turma(_,_,Prof),L),sort(L,O),length(O,X).

% c.9) Mostre as turma (nome) com o numero de alunos em cada turma? 
% ?- findall(Turma-NumAlunos,(turma(CodTurma,Turma,_), contaAlunos(CodTurma,NumAlunos)), L).
contaAlunos(CdTurma, NumAlunos):- findall(1,(participante(_,CdTurma)),L), sum_list(L,NumAlunos).


% Q 02 - Codificar as tabela abaixo no Prolog e fazer as consultas abaixo:

%emp(cdemp ,nome ,fone, salario, chefe, depto)
 emp(1,obilac,2688,20000,3,s).
 emp(2,silva,2677,30000,0,h).
 emp(3,cabral,1088,22000,2,s).
 emp(4,lobato,4590,28000,2,h).
 emp(8,maria,2690,25000,4,c).
 emp(9,antune,2698,26000,8,c).
 emp(10,peter,2645,22000,8,c).

%depto(cddepto, nome, responsavel)
 depto(c,computação,8).
 depto(h,sede,2).
 depto(s,seguranca,3).

%dependente(cdemp, cddep, nome)
 dependente(2,1,jose).
 dependente(2,2,ana).

% d) Testar com as consultas:
% d.1) mostrar os empregados lotados em cada departamento;
% ? - findall(NomeDep-NomeEmp,(emp(_,NomeEmp,_,_,_,CdDepto), depto(CdDepto,NomeDep,_)),L), sort(L,O).

% d.2) mostrar o responsável por cada departamento;
% ? - findall(NomeDep-NomeResp,(depto(_,NomeDep,CdResp), emp(CdResp,NomeResp,_,_,_,_)),L).

% d.3) mostrar o chefe (com o seu depto) de cada empregado;
% ? - findall(Chef|Dep - Emp,(emp(_,Emp,_,_,CdChef,CdDep), depto(CdDep,Dep,_), emp(CdChef,Chef,_,_,_,_)),L).

% d.4) mostrar os dependentes de cada empregado;
% ? - findall(Dep - Emp,(dependente(CdEmp,_,Dep), emp(CdEmp,Emp,_,_,_,_)),L).
