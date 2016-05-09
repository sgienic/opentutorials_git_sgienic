package kr.co.hecorea.adm.dto;

public class AdmDTO {

	private String orcl;
	private String used;
	private String time;
	public String getOrcl() {
		return orcl;
	}
	public void setOrcl(String orcl) {
		this.orcl = orcl;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "AdminDTO [orcl=" + orcl + ", used=" + used + ", time=" + time + "]";
	}
	
	
}
