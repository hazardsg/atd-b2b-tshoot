# Back To Basics ATD - Troubleshooting Scenario

This repository provides a troubleshooting scenario that may arise in an enterprise environment.  The topology is a L2LS Campus fabric built on the Dual Data Center ATD Lab. For the purposes of this troubleshooting scenario we will be focusing on site1

![Topo](images/ATD-Campus-Topo.png)

## Scenario

You have arrived to the office on Monday morning to find that a change has been made and s1-host1 is no longer able to reach s1-host2.  The hosts s1-host1 and s1-host reside in vlans 10 and 20, respectively. SVIs have been created on the hosts within their respective VLANs and a static route has been configured to provide reachability between the two VLANs. If you need additional information or assistance please ask your ATD SE.  Thank you and good luck!

## Summary of Steps to Deploy Scenario

1. [Launch Programmability IDE](#step-1---launch-programmability-ide)
2. [Clone Repository to Lab IDE](#step-2---clone-repository-to-lab-ide)
3. [Update AVD to Latest Version](#step-3---update-avd-to-latest-version)
4. [Set Lab Password environment variable](#step-4---set-lab-password-environment-variable)
5. [Deploy Configs](#step-5---deploy-configs)
6. [Begin Scenario](#step-6---begin-scenario)

## STEP #1 - Launch Programmability IDE

- Launch the Progammability IDE.  If this is the first time starting the IDE you will be prompted for a code-server password.  Your unique password is noted on the Lab Topology page.

<img src="images/code-server.png" alt="folder" width="400"/>

- Click through any pop-ups that may occur.
- Start a new terminal session by clicking on the hamburger and selecting Terminal->New Terminal.

![Topo](images/programmability_ide.png)

## STEP #2 - Clone Repository to Lab IDE

- Change into `labfiles` sub-directory.  From here, clone the repo and change into directory. Remaining commands will be executed from here.

``` bash
cd /home/coder/project/labfiles
git clone https://github.com/daadam4/atd-b2b-tshoot.git
cd atd-b2b-tshoot
```

## STEP #3 - Update AVD to Latest Version

- From the terminal session, run the following commands.

``` bash
ansible-galaxy collection install arista.avd arista.cvp --force
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd --format yaml | head -1 | cut -d: -f1)
pip3 config set global.disable-pip-version-check true
pip3 install -r ${ARISTA_AVD_DIR}/arista/avd/requirements.txt
```

## STEP #4 - Set Lab Password environment variable

The following command sets the environment variable LABPASSPHRASE which is used later for connecting to your lab switches and creating local user password.

``` bash
export LABPASSPHRASE=`cat /home/coder/.config/code-server/config.yaml| grep "password:" | awk '{print $2}'`
```

## STEP #5 - Deploy Configs

From the terminal window, run the command below to execute an ansible playbook and build the AVD generated configurations and store them in a local directory `intended/configs`.

``` bash
make deploy
```

## STEP #6 - Begin Scenario

Begin troubleshooting!
