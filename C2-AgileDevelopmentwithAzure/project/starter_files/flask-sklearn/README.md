# Overview
<br />

This is a Project to full fill a DevOps Engineer for Microsoft Azure - Udacity Nano Degree Program. In this project a web service that uses ML model to predict Boston house
prices wad deployed using Azure DevOps pipeline.

[![Build Status](https://dev.azure.com/mikiye-24/Flask-App-Deploy/_apis/build/status/Mikisho.Azure-Cloud-DevOps?branchName=master)](https://dev.azure.com/mikiye-24/Flask-App-Deploy/_build/latest?definitionId=2&branchName=master)

## Project Plan

* A link to a Trello board for the project:
  https://trello.com/b/gf5RQZPp/agile-sprint-board

* A link to a spreadsheet that includes the original and final project plan:
  https://docs.google.com/spreadsheets/d/1i-65rF7W7J3e0yg0FJB9fBvrFL1WQMbj2DClCh8Gq7Y/edit#gid=0

## Instructions

* Architectural Diagram  
  
  ![Architectural Diagram img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/Arch-Diag.JPG)

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

### Running the App Locally using Docker

* Docker needs to be installed to run the app
* Go to the app path: `Azure-Cloud-DevOps\C2-AgileDevelopmentwithAzure\project\starter_files\flask-sklearn`
* Run `./run_docker.sh`

* You will get the following output
  
  ![Docker output img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/run_docker_local.JPG)

* Once you get this output open a new terminal and go to app path: `Azure-Cloud-DevOps\C2-AgileDevelopmentwithAzure\project\starter_files\flask-sklearn`

* Run `./make_prediction.sh`

* You will get the following output

  ![local prediction img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/local_predic_output.JPG)

## Azure DevOps Pipeline

* Project running on Azure App Service

  ![Azure App service img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/AZ_deployed-app.JPG)

* Project cloned into Azure Cloud Shell

  ![Cloudshell img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/Cloned_AZ_cloudshell.JPG)

* Passing tests that are displayed after running the `make all` command from the `Makefile`

  ![Passing tests img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/Make_passed.JPG)

* Output of a test run
  

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

  ![Azureapp img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/AZ_CI-CD_Working.JPG)

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/Mikisho/Azure-Cloud-DevOps/tree/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearnmake_predict_azure_app.sh).
The output should look similar to this:

  ![prediction output img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/predict_app.JPG)


* Output of streamed log files from deployed application

  ![log output img file](https://github.com/Mikisho/Azure-Cloud-DevOps/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/Screenshots/log_output.JPG)

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


