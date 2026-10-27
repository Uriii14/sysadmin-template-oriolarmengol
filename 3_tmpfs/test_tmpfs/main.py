from typing import Any, Union
from os import PathLike
from pathlib import Path

import os
import time
import shutil

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
    print(f"Relation aspect between tmpfs speed and normal speed results in tmpfs being {relation:.2f} times faster. ")
    # Other relation aspects:
    print(f"Speed: tmpfs = {1024/tmpfs_result:.2f} MiB/s, normal = {1024/normal_result:.2f}")
    tmpfs_size = shutil.disk_usage(tmpfs_path)
    normal_size = shutil.disk_usage(normal_path)
    print(f"Size: tmpfs = {tmpfs_size.total/(1024*1024*1024):.1f}GiB, normal = {normal_size.total/(1024*1024*1024):.1f} GiB")
    


def benchmark(path: Union[str, PathLike]) -> float:
    # We define the file where the full 0's will be.
    test_file = Path(path) / "benchmark.tmp"
    # Start the timer (returns a float, so will do the benchmark)
    start = time.perf_counter()
    # We open test_file and write. As we defined CHUNK as a byte file, we need to open the file with "wb" not just "w"
    # because it would raise TypeError ("w" text, "wb" bytes).
    with open(test_file, "wb") as f:
        for _ in range(FILE_SIZE_MB):
            f.write(CHUNK)
        # We must push the data to the disk, because if not, it will be count as done when RAM finishes, wich would look as
        # fast as tmpfs. For tmpfs test won't affect because it has no disk.
        f.flush()
        os.fsync(f.fileno())
    # We get the time of the moment it finishes, and substract the initial to get the duration.
    total_time = time.perf_counter() - start
    # Removes the file for not having 1GB there, and also for if we do multiple tests for not filling the tmpfs (2GB).
    test_file.unlink()
    return total_time



def relation_aspect(normal_result: float, tmpfs_result: float) -> float:
    return normal_result/tmpfs_result

if __name__ == '__main__':
    main()