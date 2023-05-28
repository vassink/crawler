#!/bin/bash
## Hola, Edu. Para usar este script, primero abre el terminal y cámbiate al directorio donde descargaste este archivo, escribiendo:
## cd ~/Carpeta/
## Para escribir el nombre de la carpeta a la que te meterás, puedes presionar dos veces Tab para que te aparezcan a las que puedes
## ir, o puedes hacer lo mismo luego de escribir las primeras letras del nombre del directorio para que se autocomplete y no lo tengas
## que escribir letra por letra.
## Luego, escribe esto para hacer ejecutable el script:
## sudo chmod +x ./rsp.sh
## Te pedirá la contraseña de tu mac.
## Luego, para ejecutar el script, escribe:
## ./rsp.sh
## Ahora te cambias al directorio donde estará la carpeta donde tendrás el repositorio, nuestro proyecto:
## cd ~/Carpeta/
## Ahora, escribe el siguiente comando:
## rsp
## Y listo. Cualquier problema, me avisas.

git clone https://github.com/delibellus/crawler.git
echo -e '\n\nAhora te pedirá la contraseña de tu mac para instalar un gestor que te permitirá subir aportes sin tener que escribir tus credenciales:'
sudo brew install gh
echo -e '\n\nAhora te pedirá escoger un protocolo. Escoge "github.com", luego "https", luego tipea "y" y luego escoge "token":'
gh auth login
echo -e '\n\nEsto te pedirá tu nombre de usuario en github y una contraseña que te dejé en el whatsapp:'
git push origin main

if [[ -e ~/.bashrc ]]; then
    echo "alias rsp='git add -A && git commit -m && git push origin main'" >> ~/.bashrc
else
    echo "#!/bin/bash" > ~/.bashrc && echo "alias rsp='git add -A && git commit -m && git push origin main'" >> ~/.bashrc
fi

source ~/.bashrc

echo -e '\n\nAhora, cada vez que subas un aporte, puedes escribir solo "rsp" y se subirá, siempre y cuando te encuentres en la carpeta del repositorio.\nCada vez que lo hagas, te pedirá especificar qué aportaste o modificaste.'
