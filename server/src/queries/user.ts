const queries = {
  signup: `INSERT INTO USER (id, password) VALUES (?, ?);`,
  findUserByID: `SELECT * FROM USER WHERE id = ?`,
};

export default queries;
