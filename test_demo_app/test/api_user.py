import requests
import string
import json
host_url = 'http://127.0.0.1:8080'
headers = {
    'Content-Type': 'application/json'
}
headers1 = {
  'Content-Type': 'application/json'
}
allowed_fields = (
    'firstname',
    'lastname',
    'phone'
)

''' 
1. Register new users
'''

def test_post_register_new_user():
    url = host_url + '/api/users'
    new_user = json.dumps({
                'username': 'tim231',
                'password': '1234',
                'firstname': 'tim',
                'lastname': 'run',
                'phone': '3556666666'
                })
    response = requests.request('POST', url, headers=headers1, data=new_user)
    response = response.status_code
    assert_request_created_successfully(response)

'''
2. Review users registered in system
'''

def test_get_all_user_list():
    url = host_url + '/api/users'
    response = requests.request('GET', url, headers=headers)
    json_response = response.json()
    expected_users = ['tim23']
    assert json_response['status'] == 'SUCCESS'
    for username in expected_users:
        assert username in json_response['payload']



def assert_request_created_successfully(response):
    assert response == 201

