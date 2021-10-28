import requests
from requests import get


def download(url, file_name):
    try:
        response = get(url)
        if response.status_code == 200:
            with open(file_name, "wb") as file:
                file.write(response.content)
            print('File saved!')
        else:
            print(f"Returned not 200 code. The code is {response.status_code}.")
    except requests.ConnectionError:
        print("ConnectionError")
    except requests.HTTPError:
        print("HTTPError")
    except requests.RequetsException:
        print("RequetsException")
    except requests.ReadTimeout:
        print("ReadTimeout")
    except requests.Timeout:
        print("Timeout")
    except requests.ConnectTimeout:
        print("ConnectTimeout")