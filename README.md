*HOW TO * 

The following will have two options 

`1. To run on Local Machine (Developer)` 
`2. To Run On Public Cloud (Azure/AWS)` 

*Pre-Req* 
For Local 
```1. Vagrant```
```2. Virtualbox``` 
```3. Packer``` 
```4. Docker``` 
```5. Ansible```
```6. Python with Flask *Under Developmen``` 

*For Cloud*
`1. Azure AD Credentials`
`2. Pre-Defined Resource and Storage BLOB` 



*Executing* 


Change the Permissions of the file to be executable 

```
chmod +x run.sh 
./run.sh 
```


*Alternatively you can also run using* (Am Working on a more interactive and Ncurses Part and Silent Install) 
```
/bin/bash run.sh 
```
 

 
Ports Being Forwarded in Vagrant Box 
```
    default: Forwarding ports...
    default: 3389 (guest) => 3389 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
    default: 5985 (guest) => 55985 (host) (adapter 1)
    default: 5986 (guest) => 55986 (host) (adapter 1)
```




Credits

*For Flask Docker* 
`https://hub.docker.com/r/tiangolo/uwsgi-nginx-flask/`






For Flask: 

* Make Sure Flask is installed 
pip install flask 


* Create the Virtual Environment 
python3 virv motf 

* Create the Envirnment 
source motf/bin/activate

* EXPORT the Application
export FLASK_APP=web.py

* Test your Application Locally 
* Make sure you in the website directory 
flask run

