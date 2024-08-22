public class Student {
    private String name;
    private int num; //교번 //키
    private String major;
    private String phone; //전화번호

    public Student(String name, int num, String major, String phone) {
        this.name = name;
        this.num = num;
        this.major = major;
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public int getNum() {return num;}

    public String getMajor() {
        return major;
    }

    public String getPhone() {
        return phone;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
