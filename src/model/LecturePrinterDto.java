package model;

import java.io.Serializable;

public class LecturePrinterDto implements Serializable{
    String subject_name;
    String lectureKind;
    int lectureLevel;
    String lectureName;
    int termOfProvide;
    String teacher;
    int price;
    String in_basket;

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public String getLectureKind() {
        return lectureKind;
    }

    public void setLectureKind(String lectureKind) {
        this.lectureKind = lectureKind;
    }

    public int getLectureLevel() {
        return lectureLevel;
    }

    public void setLectureLevel(int lectureLevel) {
        this.lectureLevel = lectureLevel;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public int getTermOfProvide() {
        return termOfProvide;
    }

    public void setTermOfProvide(int termOfProvide) {
        this.termOfProvide = termOfProvide;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getIn_basket() {
        return in_basket;
    }

    public void setIn_basket(String in_basket) {
        this.in_basket = in_basket;
    }

    @Override
    public String toString() {
        return "LecturePrinterDto{" +
                "subject_name='" + subject_name + '\'' +
                ", lectureKind='" + lectureKind + '\'' +
                ", lectureLevel=" + lectureLevel +
                ", lectureName='" + lectureName + '\'' +
                ", termOfProvide=" + termOfProvide +
                ", teacher='" + teacher + '\'' +
                ", price=" + price +
                ", in_basket='" + in_basket + '\'' +
                '}';
    }
}
