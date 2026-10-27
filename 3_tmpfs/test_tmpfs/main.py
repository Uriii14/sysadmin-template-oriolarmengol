from typing import Any, Union
from os import PathLike
from pathlib import Path

import os
import time

FILE_SIZE_MB = 1024         # 1GB of file, under 2GB of tmpfs in order it can work properly.
CHUNK = b"0"*(1024*1024)    # We write 1GB of 0's

def main() -> None:
    # TODO: Make sure to add some logic and prints so teacher's can see the results

    normal_path = '/home/uriii/AMSA/sysadmin-template-oriolarmengol/3_tmpfs'
    print(f"Normal path: {normal_path}")

    tmpfs_path = '/home/uriii/AMSA/sysadmin-template-oriolarmengol/3_tmpfs/mytmpfs'
    print(f"tmpfs path: {tmpfs_path}")

    # We call benchmark to calculate the time of the execution
    # and we add a print so we can see them, with 4 decimals.
    normal_result = benchmark(normal_path)
    print(f"Normal result time: {normal_result:.4f} seconds")
    tmpfs_result = benchmark(tmpfs_path)
    print(f"Tmpfs result time: {tmpfs_result:.4f} seconds")

    # We call relation_aspect to calculate how faster is tmpfs compared to normal
    # and we add a print so we can see the ratio, with 2 decimals.
    relation = relation_aspect(normal_result, tmpfs_result)
    print(f"Relation aspect between tmpfs speed and normal speed results in tmpfs beeing {relation:.2f} times faster. ")

def benchmark(path: Union[str, PathLike]) -> Any:
    raise NotImplementedError("Benchmarking not implemented yet")

def relation_aspect(normal_result: float, tmpfs_result: float) -> float:
    return normal_result/tmpfs_result

if __name__ == '__main__':
    main()