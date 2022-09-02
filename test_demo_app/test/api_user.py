import requests
import string
import json
host_url = 'http://127.0.0.1:8080'
headers = {
    'Content-Type': 'application/json',
    'Token': 'MjEyNDkwMTkzMDcxNTEzMTI1ODAzOTczNzM1NjM4MDgwNTkzNDAw'
}
headers1 = {
  'Content-Type': 'application/json'
}
allowed_fields = (
    'firstname',
    'lastname',
    'phone'
)
def test_post_register_new_user():
    url = host_url + '/api/users'
    new_user = json.dumps({
                'username': 'tim23',
                'password': '1234',
                'firstname': 'tim',
                'lastname': 'run',
                'phone': '3556666666'
                })
    response = requests.request('POST', url, headers=headers1, data=new_user)
    response = response.status_code
    assert_request_created_success(response)


def test_get_all_user_list():
    url = host_url + '/api/users'
    response = requests.request('GET', url, headers=headers)
    json_response = response.json()
    expected_users = ['tim23']
    assert json_response['status'] == 'SUCCESS'
    for username in expected_users:
        assert username in json_response['payload']



def assert_request_created_success(response):
    assert response == 201

def assert_field_values_from_response(response, value):
    json_response = response.json()
    for field in allowed_fields:
        assert json_response['payload'][field] == value

def assert_request_response_success(response):
    json_response = response.json()
    assert json_response['status'] == 'SUCCESS'

