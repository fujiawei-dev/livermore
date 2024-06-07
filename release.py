import hashlib
import os.path
import shutil
from pathlib import Path
from typing import NamedTuple, Union

import urllib3
from webdav3.client import Client

urllib3.disable_warnings()


class Auth(NamedTuple):
    Host: str
    User: str
    Password: str
    App: str


DefaultAuth = Auth(
    Host="https://dav.jianguoyun.com/dav/webdav",
    User="rustlekarl@gmail.com",
    Password="a4w2hp6g9m7ai9pm",
    App="livermore",
)


def upload_to_webdav(
    path: Union[str, Path],
    remote_path: Union[str, Path] = None,
    auth: Auth = DefaultAuth,
):
    client = Client(
        dict(
            webdav_hostname=auth.Host,
            webdav_login=auth.User,
            webdav_password=auth.Password,
            disable_check=True,
        )
    )

    client.verify = False  # To not check SSL certificates (Default = True)

    if remote_path is None:
        remote_path = os.path.basename(path)

    # 上传覆盖同名文件
    client.upload_sync(remote_path=f"{auth.App}/{remote_path}", local_path=path)


def checksum(path, block_size=1 << 20, byte=False) -> str:
    checker = hashlib.sha256()

    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(block_size), b""):
            checker.update(chunk)

    return checker.digest() if byte else checker.hexdigest()


def release():
    src = "build/app/outputs/flutter-apk/app-release.apk"
    dst = "livermore.apk"
    version = "version.txt"

    shutil.copy(src, dst)

    with open(version, "w") as fp:
        fp.write(checksum(dst))

    upload_to_webdav(dst)
    upload_to_webdav(version)


if __name__ == "__main__":
    release()
