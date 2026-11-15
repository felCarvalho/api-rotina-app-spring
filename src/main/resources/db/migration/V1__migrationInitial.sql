
CREATE TABLE users (
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
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ

);

CREATE TABLE tasks (
    id VARCHAR(50) PRIMARY KEY ,
    title TEXT NOT NULL ,
    description TEXT ,
    status VARCHAR(20) NOT NULL CHECK (status IN ('concluida', 'incompleta')),
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE credentials (
    id VARCHAR(50) PRIMARY KEY ,
    identifier TEXT NOT NULL ,
    provider TEXT NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE passHash (
    hash TEXT NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id TEXT NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE permissions (
    slug VARCHAR(50) PRIMARY KEY ,
    name VARCHAR(50) NOT NULL ,
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ

);

CREATE TABLE roles (
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
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE rolesPermissions (
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    role_id VARCHAR(50) NOT NULL ,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(slug) ,
    permission_id VARCHAR(50) NOT NULL ,
    CONSTRAINT fk_permission FOREIGN KEY (permission_id) REFERENCES permissions(slug)
);

CREATE TABLE userRoles (
    created_at TIMESTAMPTZ NOT NULL ,
    updated_at TIMESTAMPTZ NOT NULL ,
    deleted_at TIMESTAMPTZ ,
    user_id VARCHAR(50) NOT NULL ,
    role_id VARCHAR(20) NOT NULL ,
    PRIMARY KEY (user_id, role_id) ,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(slug)

);