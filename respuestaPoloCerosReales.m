%pkg load control

c1 = 15e-9
c2 = 2.7e-9
r1 = 220000
r2 = 1000000
r3 = 8648

A = -1/(c1*r1)
B = (1/c2 + 1/c1)*(1/r3)
C = (1/r1 + 1/r2)*(1/(c1*c2*r3))
s = tf('s'); % se crea una variable que luego nos ayuda a formar la
             % funcion de transferencia
 
Hs = (A*s)/(s^2+s*B+C)

%num = [1.356 * 10**7, 0, 0]
%den = [1, 5207, 1.389 * 10**8, 3.264 *10**11, 3.928*10**15]

H = ((1.356 * 10^7)*s^2) / (s^4 + 5207*s^3 +(1.389 * 10^8)* s^2 + (3.264 *10^11)*s + 3.928*10^15)

H1 = (-(2626)*s)/((s^2 + 2177*s + 4.498*10^7))

H2 = (-(3086)*s)/((s^2 + 3030*s + 8.732e+07))
 
bode (H)
%bode (H2)
%subplot(211),title('Diagramas de Bode')
%ylabel('Ganancia [dB]')
%subplot(212), ylabel('Fase [grados]')
%xlabel('Frecuencia [rad/s]')
