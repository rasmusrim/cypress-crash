FROM mcr.microsoft.com/windows/servercore:ltsc2022
WORKDIR C:/Downloads

RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force;
RUN powershell -Command [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12';
RUN powershell -Command iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

RUN powershell -Command choco install nodejs.install microsoft-edge googlechrome firefox -y

RUN npm i lite-server cross-env wait-on -g

COPY ./dist/* c:/dist/
COPY ./cypress/* c:/cypress/

COPY run.ps1 c:/Downloads

ENTRYPOINT "powershell -Command c:\Downloads\run.ps1"


