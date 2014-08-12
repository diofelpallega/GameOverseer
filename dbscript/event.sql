Skip to content
 
This repository 
Explore
Gist
Blog
Help
Kay Apao kay-apao25
 
 
6  Unwatch 
  Star 0
 Fork 0 ronzohan/GameOverseer
 branch: master   GameOverseer / dbscript / event.sql
Kay Apao kay-apao25 5 minutes ago Change of the misnamed variable in event.sql
2 contributors  Kay Apao  Ron Daryl L. Magno
129 lines (97 sloc)  2.247 kb RawBlameHistory   
create table events(
    e_id int primary key,
    eDate text,
    eLocation text,
    eTime text,
    scores int
);

--HOW TO USE:
-- SELECT loadCEvents(1);

create or replace function loadCEvents(in int, out text, out text, out text) 

	returns setof record as

$$ 
     
	select eDate, eLocation, eTime from events
    
                where e_id = $1;
    

$$
 
language 'sql';

--HOW TO USE:
-- SELECT setFixE(1, 'December 5, 2014', 'Iligan City', '9:00 - 5:00 pm');

create or replace function setFixE(p_e_id int,
	p_eDate text, p_eLocation text, 
	p_eTime text) 
returns text as
$$
declare
  v_e_id int; 
begin
  select into v_e_id e_id from events
	where e_id = p_e_id;
  if v_e_id isnull then
	insert into events(e_id, eDate, 
	eLocation, eTime) values
	(p_e_id, p_eDate, p_eLocation, p_eTime);
  else
	update events

<<<<<<< HEAD
	set eDate = p_eDate,eLocation = p_eLocation,eTime = p_eTime
=======
	set eDate = p_eDate,eDate = p_eLocation,eTime = p_eTime
>>>>>>> fbe2489c1ae4e96fff54bd5fb1934b75f77f37aa
          where e_id = p_e_id;
	    
  end if;
    return 'OK';
  end;
$$
    language plpgsql;
	
--HOW TO USE:
-- SELECT setScore(1, 20);

create or replace function setScore(p_e_id int,
	p_score int) 
returns text as
$$
declare
  v_e_id int; 
begin
  select into v_e_id e_id from events
	where e_id = p_e_id;
  if v_e_id isnull then
	insert into events(scores) values
	(p_score);
  else
	update events

	set scores = p_score where e_id = p_e_id;
	
	    
  end if;
    return 'OK';
  end;
$$
    language plpgsql;	
	
--HOW TO USE:
-- SELECT getScore(1);

create or replace function getScore(in int, out int) 

	returns int as

$$ 
     
	select scores from events
    
                where e_id = $1;
    

$$
 
language 'sql';

--HOW TO USE:
-- SELECT ReSchedE(1, 'September 13, 2014','Cagayan','8:00 am - 4:00 pm');

create or replace function ReScedE(p_e_id int,
	p_eDate text, p_eLocation text, 
	p_eTime text) 
returns text as
$$
declare
  v_e_id int; 
begin
  select into v_e_id e_id from events
	where e_id = p_e_id;
  
  update events
<<<<<<< HEAD
	set eDate = p_eDate, eLocation = p_eLocation,eTime = p_eTime
=======
	set eDate = p_eDate,eDate = p_eLocation,eTime = p_eTime
>>>>>>> fbe2489c1ae4e96fff54bd5fb1934b75f77f37aa
          where e_id = p_e_id;
	    
    return 'OK';
  end;
$$
    language plpgsql;
 
Status API Training Shop Blog About © 2014 GitHub, Inc. Terms Privacy Security Contact 