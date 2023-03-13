
<hr>

# BeefTriRapide is a quicksort with 3 different styles of array :

<a href="https://www.beeflang.org/docs/corlib/">Beeflang</a>

<a href="https://github.com/beefytech/Beef/">Github Beefl</a>

Output :

```
Fichier de : 50000

Test d'un tableau dynamique comme en C
Time elapsed in millis : 3


Test d'un tableau Beef
Time elapsed in millis : 8


Test d'une liste d'entiers et la fonction sort qui est intégrée
Time elapsed in millis : 6
```

<hr>

# DLangTriRapide :

<a href="https://dlang.org/">DLang</a>

<a href="https://dlang.org/orgs-using-d.html">Organizations using the D Language</a>

Output: 

```
Tableau d'entiers
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548, ... ]
Nombre de nb_de_mots : 50000
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6, ... ]
0.007182 sec
515083 permutations



Tableau de string
[ "45754", "14018", "19426", "227", "2066", "32748", "48134", "39741", "13501", "26548", ... ]
Nombre de nb_de_mots : 50000
[ "0", "0", "3", "3", "4", "4", "4", "6", "6", "6", ... ]
0.023746 sec
515083 permutations



Tableau char[][]
[ "45754", "14018", "19426", "227", "2066", "32748", "48134", "39741", "13501", "26548", ... ]
Nombre de nb_de_mots : 50000
[ "0", "0", "3", "3", "4", "4", "4", "6", "6", "6", ... ]
0.042796 sec
515083 permutations



Fonction 'Sort' entier dlang
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548, ... ]
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6, ... ]
0.020063 sec
```

<hr>

# Python Quicksort :

<a href="https://www.python.org/downloads/">Python downloads</a>

Output:

```
Fonction 'sorted' du système
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548, ... ]
type(t):<class 'list'>
type(t[0]:<class 'str'>
Tri de ce tableau avec sorted(x, key=int) : 0.015943099977448583 s
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6, ... ]


Fonction 'sorted' du système
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548, ... ]
type(t):<class 'list'>
type(t[0]:<class 'int'>
Tri de ce tableau avec sorted : 0.008168700034730136 s
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6, ... ]


Tri rapide fait main
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548, ... ]
type(t):<class 'list'>
type(t[0]:<class 'int'>
Tri de ce tableau avec tri_rapide fait à la main : 0.15662500000325963 s
Nombre de permutations : 515083
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6, ... ]

Python version3.11.1 (tags/v3.11.1:a7a450f, Dec  6 2022, 19:58:39) [MSC v.1934 64 bit (AMD64)]

Version infosys.version_info(major=3, minor=11, micro=1, releaselevel='final', serial=0)
```

<hr>

# Go Quicksort :

<a href="https://go.dev/learn/">Go</a>

Output:

```
[]int
[45754 14018 19426 227 2066 32748 48134 39741 13501 26548]
0.003087 sec
[0 0 3 3 4 4 4 6 6 6]
Nombre d'échanges : 515083


[]int32
[45754 14018 19426 227 2066 32748 48134 39741 13501 26548]
0.004767 sec
[0 0 3 3 4 4 4 6 6 6]
Nombre d'échanges : 515083


[]string sort.Slice
[45754 14018 19426 227 2066 32748 48134 39741 13501 26548]
0.019565 sec
[0 0 3 3 4 4 4 6 6 6]

[]string  tri_rapide_string_byLength
[45754 14018 19426 227 2066 32748 48134 39741 13501 26548]
0.015676 sec
[0 0 3 3 4 4 4 6 6 6]
Nombre d'échanges :1132863
```

<hr>

# C Quicksort :

Output:

```
Hello
50000 éléments à trier

tab de int
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548 ...  ]
Time CPU: 0.005740 s
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6 ...  ]
515083 permutations

tab de string
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548 ...  ]
Time CPU: 0.026356 s
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6 ...  ]
515083 permutations

tab de int et qsort du système
[ 45754, 14018, 19426, 227, 2066, 32748, 48134, 39741, 13501, 26548 ...  ]
Time CPU: 0.005314 s
[ 0, 0, 3, 3, 4, 4, 4, 6, 6, 6 ...  ]
```

<hr>

# Java Quicksort :

Output:

```
Byte.MAX_VALUE = 127
Integer.MAX_VALUE = 2147483647
Short.MAX_VALUE = 32767
Integer.MAX_VALUE = 2147483647
Long.MAX_VALUE = 9223372036854775807
Float.MAX_VALUE = 3.4028235E38
Double.MAX_VALUE = 1.7976931348623157E308
Character.MAX_VALUE = 65535
Math.pow(2, 31)-1 = 2.147483647E9
((Math.pow(2, 31) - 1) == Integer.MAX_VALUE) = true

Tri avec des entiers signÃ©s sur 32 bits
50000 lignes lues
45754 14018 19426 227 2066 32748 48134 39741 13501 26548 41998 11462 13018 23742 44003 4076 49703 4017 49610 2055
Temps mis pour ce tri rapide : 0.0101794 sec
0 0 3 3 4 4 4 6 6 6 7 8 8 9 10 12 13 13 13 14
```

