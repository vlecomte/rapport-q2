% Measurements
f = [10;20;29;51;69;99;197;289;
        505;688;994;1964;2940;5070;6920;10010];
Vin = [5.75;5.75;5.75;5.74;5.73;5.73;5.67;5.62;
        5.55;5.52;5.52;5.51;5.54;5.67;5.86;6.34];
Vr = [0.181;0.351;0.514;0.896;1.18;1.66;2.90;3.64;
        4.57;4.89;5.16;5.38;5.46;5.64;5.84;6.39];
Vc = [5.78;5.75;5.72;5.65;5.57;5.45;4.79;4.18;
        3.03;2.42;1.80;0.980;0.691;0.433;0.341;0.251];
R = 1003;
C = 433e-9;

loglog(f,Vin,f,Vr,'-*',f,Vc,'-*');

% Gain for high-pass and low-pass filters
Gph = Vr ./ Vin;
Gpb = Vc ./ Vin;

loglog(f,Gph,'-*',f,Gpb,'-*');

% Point subsets for the linear approximation
left = [1 2 3 4 5];
right = [12 13 14 15 16];

% Abscissae for displaying the lines
log_f = linspace(log(f(1)), log(f(16)));
reg_f = exp(log_f);
% Ordinates for displaying the cutoff frequency
vertical = exp(linspace(-3,0));

% Calculating the linear approximations for high-pass
phleft = approx_lin1(log(f(left)), log(Gph(left)));
phleftline = exp(phleft(1) * log_f + phleft(2));
phright = approx_lin1(log(f(right)), log(Gph(right)));
phrightline = exp(phright(1) * log_f + phright(2));
% Cutoff frequency: intersection of the lines
fc_ph = exp(-(phright(2)-phleft(2))/(phright(1)-phleft(1)));

loglog(f, Gph, 'o', reg_f, phleftline, reg_f, phrightline,
        ones(size(vertical))*fc_ph, vertical, '--');

% Calculating the linear approximations for low-pass
pbleft = approx_lin1(log(f(left)), log(Gpb(left)));
pbleftline = exp(pbleft(1) * log_f + pbleft(2));
pbright = approx_lin1(log(f(right)), log(Gpb(right)));
pbrightline = exp(pbright(1) * log_f + pbright(2));
% Cutoff frequency: intersection of the lines
fc_pb = exp(-(pbright(2)-pbleft(2))/(pbright(1)-pbleft(1)));

loglog(f,Gpb,'o', reg_f, pbleftline, reg_f, pbrightline,
        ones(size(vertical))*fc_pb, vertical, '--');

% Theoretical functions based on the measured cutoff frequency
ones_f = ones(size(reg_f));
ph_theory = 1 ./ sqrt(1 + (fc_ph./reg_f).^2);
pb_theory = 1 ./ sqrt(1 + (reg_f./fc_pb).^2);

loglog(f,Gph,'o',f,Gpb,'o', reg_f, ph_theory, reg_f, pb_theory);

% Theoretical asymptotes and cutoff frequencies
phleft_theory = [1 log(2*pi*R*C)];
phright_theory = [0 0];
pbleft_theory = [0 0];
pbright_theory = [-1 -log(2*pi*R*C)];
fc_ph_theory = fc_pb_theory = 1/(2*pi*R*C);
