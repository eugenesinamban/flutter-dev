# Flutter Dev

## About
It uses the _Remote Development_ extension from the Visual Studio Code that allows you to open any folder in the container and work with it in the IDE that is installed on the host machine. A development environment for flutter, right inside your Docker container.

## Installation
Install the following : 
  * Docker
  * Visual Studio Code 
  * Remote Development extension for VSC
Then :
* clone this repository (before this make sure that you have _git_ installed on your machine),
* create a directory `workspace` inside the cloned repository folder,
* open Visual Studio Code and click on the green icon in the bottom left corner of the window,
* from the popup menu choose: `Remote-Containers: Open Folder in Container...`,
* from the opened dialog navigate to the cloned repository, i.e. _flutter_dev_,
* now you have to wait until the building process is finished. It can take a couple of minutes. You can follow it step by step by clicking _details_ in the dialog that appears in the bottom right corner of the window.
