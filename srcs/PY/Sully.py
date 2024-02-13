import subprocess
CODE = """import subprocess
CODE = {1}{1}{1}{0}{1}{1}{1}

def main():
    i = {2}
    if i <= 0:
        return
    if "Sully_" in __file__:
        i-= 1
    with open(f"Sully_{{i}}.py", "w") as f:
        f.write(CODE.format(CODE, chr(34), i))
        f.close()
    subprocess.run(["python3", f"Sully_{{i}}.py"])

if __name__ == "__main__":
    main()
"""

def main():
    i = 5
    if i <= 0:
        return
    if "Sully_" in __file__:
        i-= 1
    with open(f"Sully_{i}.py", "w") as f:
        f.write(CODE.format(CODE, chr(34), i))
        f.close()
    subprocess.run(["python3", f"Sully_{i}.py"])

if __name__ == "__main__":
    main()
