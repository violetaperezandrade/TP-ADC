pkg install -forge control
pkg install -forge symbolic
pkg load control
pkg load symbolic
warning('off', 'all');

num = [1,0,0,0,0];
den = [1, 4926, 1.213 * 10^7, 1.75 * 10^10, 1.262 * 10^13];
H = tf(num, den);

syms s
syms t positive
[z, p] = zpkdata(H);

printf("Ceros y polos: \n")
z,p

r1 = [-721.28 + 1741.41i, -721.28 - 1741.41i];
r2 = [-1741.72 +  720.14i, -1741.72 - 720.14i];
p1 = poly(r1);
p2 = poly(r2);

printf("Primer polinomio: ")
polyout(p1)


printf("\nSegundo polinomio: ")
polyout(p2)

#tomo el termino independiente como el promedio entre ambos valores: 3.5525
w0 = (3.5525e+06)^0.5
Q1 = w0 / 1442.6

#w0_2 = (3.5522e+06)^0.5
Q2 = w0 / 3483.4

#H(s) / s
num = [1,0,0,0];
den = [1, 4926, 1.213 * 10^7, 1.75 * 10^10, 1.262 * 10^13];
Hesc = tf(num, den);
Hesc

#COMPLETAR CUADRADOS ABAJO JUNTO CON REDONDEAR LOS VALORES DA UN POCO MAS SIMPLIFICADO
A = -0.706879655;
B = -1740.738926;
C = 1.706879655;
D = 1740.738926;

#Valores redondeados
Ar = -0.71;
Br = -1740.74;
Cr = 1.71;
Dr = 1740.74;

b1 = 1442.6 / 2;
w01 = 3.5525e+06 - b1^2; #es elevado al cuadrado el valor

b2 = 3483.4 / 2;
w02 = 3.5525e+06 - b2^2;

frac1 = (Ar*s + Br) / ((s + b1)^2 + w01);
frac2 = (Cr*s + Dr) / ((s + b2)^2 + w02);
hesc1 = ilaplace(frac1, s, t);
hesc2 = ilaplace(frac2, s, t);
printf("Respuesta al escalon: \n")
hesc = hesc1 + hesc2

himp = diff(hesc, t)
