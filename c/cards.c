/*
 * 计算牌盒中牌数量的程序
 * 本代码使用"拉斯维加斯许可证"
 * (c) 2016, 广达21点扑克游戏小组
 */

#include <stdio.h>

int main(int argc, char const *argv[])
{
	int decks;
	puts("输入有几副牌");
	scanf("%i", &decks);
	if (decks < 1)
	{
		puts("无效的副数");
		return 1;
	}
	printf("一共有%i张牌\n", (decks * 52));
	return 0;
}