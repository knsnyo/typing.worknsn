const queries = {
  insert: `INSERT INTO WORD (word) VALUES (?);`,
  select: `SELECT * FROM WORD ORDER BY RAND() LIMIT 1;`,
};

export default queries;
