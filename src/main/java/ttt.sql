select * from subject;
select * from member where id = 'park';
select * from bank;

select t2.* from (
select rownum seq, t.* from(
select
m.mem_id id,
m.name name,
m.gender gender,
m.reg_date regDate,
m.ssn ssn,
m.email email,
m.profile_img profileImg,
m.role role,
m.phone phone,
m.major_seq majorSeq
from Member m order by reg_date desc) t)t2
where t2.seq between 1 and 10
order by t2.seq asc