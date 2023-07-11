package util;

//class M{ // 자기 자신을 생성해서 상수로 선언
//	static final M A = new M();
//	static final M B = new M();
//	static final M C = new M();
//}
//---> enum M{A, B, C}

//class N{
//	M m1 = M.A;
//}

public enum ProdSpec {
	HIT("인기"), NEW("최신"), RECOMMEND("추천");
	
	private final String value;
	
	private ProdSpec(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
}
