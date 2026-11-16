
CREATE TABLE user (
    id VARCHAR(50) PRIMARY KEY ,
    name TEXT NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ

);

CREATE TABLE category (
    id VARCHAR(50) PRIMARY KEY ,
    title TEXT NOT NULL ,
    description TEXT ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id) ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ

);

CREATE TABLE task (
    id VARCHAR(50) PRIMARY KEY ,
    title TEXT NOT NULL ,
    description TEXT ,
    status VARCHAR(20) NOT NULL CHECK (status IN ('concluida', 'incompleta')),
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE credential (
    id VARCHAR(50) PRIMARY KEY ,
    identifier TEXT NOT NULL ,
    provider TEXT NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id)

);

CREATE TABLE passHash (
    hash TEXT NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id)

);

CREATE TABLE permission (
    slug VARCHAR(50) PRIMARY KEY ,
    name VARCHAR(50) NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ

);

CREATE TABLE role (
    slug VARCHAR(50) PRIMARY KEY ,
    name VARCHAR(50) NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ

);

CREATE TABLE refreshToken (
    id VARCHAR(50) PRIMARY KEY ,
    status VARCHAR(20) NOT NULL CHECK (status IN ('ativo', 'inativo')),
    refreshHash TEXT ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id)

);

CREATE TABLE rolesPermissions (
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    role_id VARCHAR(50) NOT NULL ,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(slug) ,
    permission_id VARCHAR(50) NOT NULL ,
    CONSTRAINT fk_permission FOREIGN KEY (permission_id) REFERENCES permission(slug)
);

CREATE TABLE userRole (
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id VARCHAR(50) NOT NULL ,
    role_id VARCHAR(20) NOT NULL ,
    PRIMARY KEY (user_id, role_id) ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id) ,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(slug)

);