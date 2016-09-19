package com.hanbit.web.lambda;

import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;


public class PostLambdaList {
	public static void main(String[] args) {
		List<Integer> numbers = Arrays.asList(1,2,3,4,5);
		PostLambdaList p = new PostLambdaList();
		System.out.println( "전체 합계 : "+p.sumElems(numbers, n->true));
		System.out.println( "짝수 합계 : "+p.sumElems(numbers, n->n%2==0));
		System.out.println( "전체 합계 : "+p.sumElems(numbers, n->n%2!=0));
	}
public int sumElems(List<Integer>list,Predicate<Integer>p){
	List<Integer> numbers = Arrays.asList(1,2,3,4,5);
	int sum =0;
	for (int num : numbers){
		if (p.test(num)) {
			sum+=num;
		}
	}
	return sum;
}
}
