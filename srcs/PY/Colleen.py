# comment outside
def code():
	return """# comment outside
def code():
	return {1}{1}{1}{0}{1}{1}{1}

def main():
	# comment inside
	print(code().format(code(), chr(34)))

if __name__ == "__main__":
	main()"""

def main():
	# comment inside
	print(code().format(code(), chr(34)))

if __name__ == "__main__":
	main()
