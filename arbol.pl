% Módulo:	arbol
% Propósito:    determinar relaciones familiares
%
% Autor:        Sinuhe Velazquez
% Fecha:        15 de Octubre de 2024
% Versión:	1.0
%
% Descripción:
% Se establecen una serie de hechos que describen el orden de descendencia familiar, luego se declaran reglar para determinar el tipo de relacionde sus miembros
%
% Dependencias:
% Ninguna.
%
% Historial de Cambios:
% 15/10/2024 - 1.0 - Creación del módulo.
%------------------------------------------------------------------------------

% Hechos

% Familia paterna
padrede('Aleja', 'Sinuhe').
padrede('Aleja', 'Noe').
padrede('Aleja', 'Elizabeth').

padrede('Refugio', 'Sinuhe').
padrede('Refugio', 'Noe').
padrede('Refugio', 'Elizabeth').

% Familia materna
padrede('Martin', 'Paola').
padrede('Martin', 'Martincillo').
padrede('Martin', 'Nancy').

padrede('Alicia', 'Paola').
padrede('Alicia', 'Martincillo').
padrede('Alicia', 'Nancy').

% Familia nuclear
padrede('Sinuhe', 'Jesus').  
padrede('Sinuhe', 'Paulina').
padrede('Sinuhe', 'Diego').

padrede('Paola', 'Jesus').
padrede('Paola', 'Paulina').
padrede('Paola', 'Diego').

% Reglas

% A es hijo de B si B de padre de A
hijode(A,B) :-
    padrede(B, A).

% A es hermano de B si ambos tienen un padre C
hermanode(A,B) :-
    padrede(C, A),
    padrede(C, B),
    A \== B. 

% A es abuelo de B si A tiene un hijo C que tiene un hijo B 
abuelode(A, B) :-
    hijode(C, A),
    hijode(B, C).

% A es nieto de B si B es abuelo de A
nietode(A, B) :-
    abuelode(B, A).

% A es tio de B si A tiene un hermano C que tiene un hijo B
tiode(A, B) :-
    hermanode(A, C),
    padrede(C, B).

% A es sobrino de B si B es tio de A
sobrinode(A, B) :-
    tiode(B, A).

% A es suegro de B si B tiene un hijo C que tiene un padre D que tiene un padre A
suegrode(A, B) :-
    hijode(C, B),
    padrede(D, C),
    padrede(A, D).

% A es nuero de B si B es sugro de A
nuerode(A, B) :-
    suegrode(B, A).
