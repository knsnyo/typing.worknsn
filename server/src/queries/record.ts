const queries = {
  insert: `INSERT INTO RECORD(user, speed, date) VALUES (?, ?, NOW());`,
  select: `SELECT * FROM RECORD WHERE user = ?`,
};

export default queries;
