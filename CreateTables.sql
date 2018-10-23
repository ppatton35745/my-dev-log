CREATE TABLE [USER] (
	UserID INT NOT NULL PRIMARY KEY IDENTITY,
	Email Varchar(50) NOT NULL,
	[Password] Varchar(50) NOT NULL,
	LastName Varchar(30) NOT NULL,
	FirstName Varchar(30) NOT NULL
);

CREATE TABLE TOPIC (
	TopicID INT NOT NULL PRIMARY KEY IDENTITY,
	TopicName Varchar(50) NOT NULL,
);

CREATE TABLE USER_TOPIC (
	UserTopicID INT NOT NULL PRIMARY KEY IDENTITY,
	UserID INT NOT NULL,
	TopicID INT NOT NULL,
	CONSTRAINT FK_User1 FOREIGN KEY(UserID) REFERENCES [User](UserID),
	CONSTRAINT FK_Topic1 FOREIGN KEY(TopicID) REFERENCES Topic(TopicID)
);

CREATE TABLE RESOURCE_TYPE (
	ResourceTypeID INT NOT NULL PRIMARY KEY IDENTITY,
	ResourceTypeName Varchar(50) NOT NULL
);

CREATE TABLE [RESOURCE] (
	ResourceID INT NOT NULL PRIMARY KEY IDENTITY,
	ResourceTypeID INT NOT NULL,
	ResourceName Varchar(50) NOT NULL,
	CONSTRAINT FK_ResourceType1 FOREIGN KEY(ResourceTypeID) REFERENCES RESOURCE_TYPE(ResourceTypeID)
);

CREATE TABLE RESOURCE_TOPIC (
	ResourceTopicID INT NOT NULL PRIMARY KEY IDENTITY,
	ResourceID INT NOT NULL,
	TopicID INT NOT NULL,
	CONSTRAINT FK_Resource1 FOREIGN KEY(ResourceID) REFERENCES [RESOURCE](ResourceID),
	CONSTRAINT FK_Topic2 FOREIGN KEY(TopicID) REFERENCES TOPIC(TopicID)
);

CREATE TABLE USER_RESOURCE (
	UserResourceID INT NOT NULL PRIMARY KEY IDENTITY,
	ResourceID INT NOT NULL,
	UserID INT NOT NULL,
	CONSTRAINT FK_Resource2 FOREIGN KEY(ResourceID) REFERENCES [RESOURCE](ResourceID),
	CONSTRAINT FK_User2 FOREIGN KEY(UserID) REFERENCES [USER](UserID)
);

CREATE TABLE RESOURCE_ATTRIBUTE (
	ResourceAttributeID INT NOT NULL PRIMARY KEY IDENTITY,
	ResourceAttributeName Varchar(50) NOT NULL
);

CREATE TABLE RESOURCE_TYPE_ATTRIBUTE (
	ResourceTypeAttributeID INT NOT NULL PRIMARY KEY IDENTITY,
	ResourceTypeID INT NOT NULL,
	ResourceAttributeID INT NOT NULL,
	CONSTRAINT FK_ResourceAttribute FOREIGN KEY(ResourceAttributeID) REFERENCES RESOURCE_ATTRIBUTE(ResourceAttributeID),
	CONSTRAINT FK_ResourceType2 FOREIGN KEY(ResourceTypeID) REFERENCES RESOURCE_TYPE(ResourceTypeID)
);

CREATE TABLE RESOURCE_ATTRIBUTE_VALUE (
	ResourceAttributeValueID INT NOT NULL PRIMARY KEY IDENTITY,
	ResourceTypeAttributeID INT NOT NULL,
	ResourceID INT NOT NULL,
	[Value] Varchar(50) NOT NULL
	CONSTRAINT FK_ResourceTypeAttributeID FOREIGN KEY(ResourceTypeAttributeID) REFERENCES RESOURCE_TYPE_ATTRIBUTE(ResourceTypeAttributeID),
	CONSTRAINT FK_Resource3 FOREIGN KEY(ResourceID) REFERENCES [RESOURCE](ResourceID) 
);