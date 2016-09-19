package com.hanbit.web.lambda;

public class Greeting {
	interface GreetingService{
		public void greet(String name);
	}
	public void sayHello(){
		// 내부 크래스 인터페이스 구현방법2
		class EnglishGreeting implements GreetingService{
			@Override
			public void greet(String name) {
				System.out.println("Hellow "+name);
			}
		}
		GreetingService enGreeting = new EnglishGreeting();
		// 내부 크래스 인터페이스 구현방법2
		GreetingService korGreeting = new GreetingService() {
			@Override
			public void greet(String name) {
				System.out.println("안녕하세요 "+ name);
			}
		}; 
		enGreeting.greet("tom");
		korGreeting.greet("최강");
	}
}
