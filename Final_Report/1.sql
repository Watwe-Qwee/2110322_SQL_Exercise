SELECT SubjectName 
FROM Member NATURAL JOIN Subject 
WHERE firstname = ‘fname’ AND lastname = ‘lname’;
