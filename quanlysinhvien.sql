create database quanlysinhvien;
use quanlysinhvien;

create table tblSinhVien(
	sv_MaSo int not null primary key,
    sv_HoDem varchar(30),
    sv_Ten varchar(15),
    sv_NgaySinh date,
    sv_Lop int,
    sv_DiemTB float(3,2)
);

create table tblLop(
	l_ID int not null primary key,
    l_Ten varchar(20),
    l_Khoa int
);

create table tblKhoa(
	k_ID int not null primary key,
    k_Ten varchar(20)
);

drop table tblSinhVien, tblLop, tblKhoa;

alter table tblLop
add foreign key (l_Khoa) references tblKhoa(k_ID);

alter table tblSinhVien
add foreign key (sv_Lop) references tblLop(l_ID);

select * from tblSinhVien;

select concat(sv_HoDem,' ',sv_Ten) as "Tên đầy đủ" from tblSinhVien;

select sv_MaSo, sv_HoDem, sv_Ten, round(datediff(curdate(), sv_NgaySinh) / 365, 0) as sv_age from tblSinhVien;

select tblSinhVien.sv_HoDem, tblSinhVien.sv_Ten, tblSinhVien.sv_DiemTB, tblLop.l_Ten, tblKhoa.k_Ten from ((tblSinhVien
inner join tblLop on tblSinhVien.sv_Lop = tblLop.l_ID)
inner join tblKhoa on tblLop.l_Khoa = tblKHoa.k_ID)
where tblKhoa.k_Ten = 'CNTT';

select * from tblLop;

select * from tblKhoa;