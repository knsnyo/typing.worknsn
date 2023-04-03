const queries = {
  signup: `INSERT INTO USER (id, password) VALUES (?, ?);`,
  findUserById: `SELECT * FROM USER WHERE id = ?`,
};

export default queries;
