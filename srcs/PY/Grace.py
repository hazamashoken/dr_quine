# One comment
CODE = """# One comment
CODE = {1}{1}{1}{0}{1}{1}{1}

FILENAME = "Grace_kid.py"

MAIN = lambda x: x.write(CODE.format(CODE, chr(34)))

MAIN(open(FILENAME, "w"))
"""

FILENAME = "Grace_kid.py"

MAIN = lambda x: x.write(CODE.format(CODE, chr(34)))

MAIN(open(FILENAME, "w"))
