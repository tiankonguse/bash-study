import gdb

class CheckSymbol(gdb.Command):
	def __init__(self):
		# 调用父类构造函数，第一个参数就是在gdb下使用的命令名，第二个参数指定该命令属于哪一类gdb命令
		super(self.__class__, self).__init__('checksymbol', gdb.COMMAND_USER)

	# 当在gdb下输入命令并回车就会调用该方法，第一个参数是字符串，该命令后面输入的所有参数
	def invoke(self, para_str, from_tty):
		# gdb内部函数，根据空格将参数字符串分组
		paras = gdb.string_to_argv(para_str)
		if len(paras) != 2:
			print('need 2 para, address length')
			return

		addr = gdb.parse_and_eval(paras[0])
		_len = gdb.parse_and_eval(paras[1])
		print('debug info, addr is: {}, len is: {}'.format(addr, _len))

		# gdb内部函数，执行gdb命令，如果to_string为True则将命令输出返回，否则输出到gdb控制台
		raw_out = gdb.execute('x/{}xb {}'.format(_len, addr), to_string=True)
		for line in raw_out.split('\n'):
			if not line:
				continue
			one_line = line.split('\t')
			addr_detail = one_line[0]
			# 由于小端模式，将数据倒序
			symbol_addr = '0x' + ''.join([i.replace('0x', '') for i in one_line[-1:0:-1]])
			# gdb内部函数，查找地址对应的符号
			symbol_detail = gdb.execute('info symbol ' + symbol_addr, to_string=True).rstrip('\n')
			# 将数据输出到gdb控制台
			print(addr_detail, '\t', symbol_addr, '\t', symbol_detail)

# 向gdb注册该命令
CheckSymbol()