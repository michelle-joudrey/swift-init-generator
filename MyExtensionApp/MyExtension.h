struct Var {
    const char *name;
    const char *type;
};

struct Var* getVars(const char *code, int *count);
