// Ch02Ex01_INSERTION-SORT.cpp: 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#define LENGTH 7

int main()
{
	int key;
	int A[LENGTH] = { 32,43,13,56,42,12,11 };
//=====================================================================插入排序算法
	for (int j = 1; j <LENGTH; j++)
	{
		int i = j - 1;
		key = A[j];
		while (i >= 0&&A[i]>key)
		{
			A[i+1] = A[i];
			i = i - 1;
		}
		A[i + 1] = key;
	}
//=====================================================================
	for (int i = 0; i < LENGTH; i++)
	{
		printf("%d ",A[i]);
	}
    return 0;
}

