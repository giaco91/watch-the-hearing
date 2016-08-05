clear, clc, close all

%Samplerate
fs=13000; %Ultraviolete Schranke bei fs/2

%rec=1 für record, rec=0 für mp3
rec=0;

if (rec==1)
    %Start record
    recObj = audiorecorder(fs,16,1);
    record(recObj);
    disp('Starting microphone recording.\n');

    %Stop record
    fprintf('Press any key to stop recording.\n');
    pause;
    stop(recObj);
    disp('Stopped microphone recording.');
    y = getaudiodata(recObj,'double');
else
    [y,Fs] = audioread('Natur.mp3',[2000000,2700000]);
    y=sum(y,2);
    y=resample(y,fs,Fs);
end


%STFT erzeugen
dt=0.08; %Zeitlauflösung in sek
df=1/dt; %Frequenzauflösung in hz
wlen = fs*dt; 
overlap=0; 
h = floor(wlen*(1-overlap)); %Schrittweite in samples
nfft = wlen;
[stft, f, t] = stft(y, wlen, h, nfft, fs);
offset=3;%ersten paar sfft's wegschneiden
magstft=abs(stft(:,offset:end));
t=t(offset:end);

%Spektrogramm erzeugen
figure(2) 
imagesc(t, f, magstft);
axis xy

%lambdamax=Ultraviolete Grenze -- Lambdamin=Infrarote Grenze
lambdamax=750;%nanometer
lambdamin=380;
fmin=1/lambdamax;%Frequenz reziprok proportional zur Wellenlänge
fmax=1/lambdamin;

%Modelliere Pigmentabsorption der Photorezeptoren normalverteilt
%Mittelwerte
Mblue=420;%nm
Mgreen=500;
Mred=680;
%Standardabweichungen
sblue=50;
sgreen=40;
sred=50;
N=[Mblue Mgreen Mred;sblue sgreen sred];

% %Berechne Transformation
M = getFrames(magstft,fs,df,t,fmax,fmin,N);
sound(y,fs);
movie(M,1,df);
%movie2avi(M, 'hear_with_eyes.avi')





    
