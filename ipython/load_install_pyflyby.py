from IPython import get_ipython
import subprocess


ipython = get_ipython()

try:
    ipython.run_line_magic("load_ext", "pyflyby")
except ModuleNotFoundError:
    print("installing pyflyby")
    subprocess.Popen(
        ["pip", "install", "pyflyby"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    ).wait()
    ipython.run_line_magic("load_ext", "pyflyby")
