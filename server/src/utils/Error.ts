class DBError extends Error {
  constructor(message: string) {
    super(message);
    this.name = `DB ERROR`;
  }
}

class ParamsError extends TypeError {
  constructor(message: string) {
    super(message);
    this.name = `PARMAS ERROR`;
  }
}

class BodyError extends TypeError {
  constructor(message: string) {
    super(message);
    this.name = `BODY ERROR`;
  }
}

class QueryError extends Error {
  constructor(message: string) {
    super(message);
    this.name = `QUERY ERROR`;
  }
}

export { DBError, ParamsError, BodyError, QueryError };
