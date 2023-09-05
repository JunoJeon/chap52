package com.example.alpha;

import lombok.Getter;

@Getter
public class Alphaparam {
	String line;
	String column;
	
	public void setLine(String value) {
		if (value == null) {
			throw new RuntimeException("line은 NULL이면 안됩니다.");
		}
		if (value.trim().equals("")) {
			throw new RuntimeException("line은 널 스트링이면 안됩니다.");
		}
		
		int line;
		try {
			line = Integer.parseInt(value);
		} catch (Exception e) {
			throw new RuntimeException("line을 수치로 변환 할 수 없습니다. line = "+ value);
		}
		
		if(line < 0) {
			throw new RuntimeException("line은 0 이상의 값이어야 합니다. line = "+ value);
		}
		if (line > 100) {
			throw new RuntimeException("line은 100 이하의 값이어야 합니다. line = "+ value);
		}
		
		this.line = value;
	}
	
	public void setColumn(String value) {
		if (value == null) {
			throw new RuntimeException("column은 NULL이면 안됩니다.");
		}
		if (value.trim().equals("")) {
			throw new RuntimeException("column은 널 스트링이면 안됩니다.");
		}
		
		int column;
		try {
			column = Integer.parseInt(value);
		} catch (Exception e) {
			throw new RuntimeException("column을 수치로 변환 할 수 없습니다. column = "+ value);
		}
		
		if(column < 0) {
			throw new RuntimeException("column은 0 이상의 값이어야 합니다. column = "+ value);
		}
		if (column > 100) {
			throw new RuntimeException("column은 100 이하의 값이어야 합니다. column = "+ value);
		}
		
		this.column = value;
	}
}
