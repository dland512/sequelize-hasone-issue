const Sequelize = require('sequelize');
let Player;
let PlayerExtended;


main();


function main() {
    const sequelize = new Sequelize({
        dialect: 'postgres',
        host: '127.0.0.1',
        port: 5432,
        database: 'testdb6',
        username: 'postgres',
        password: null,
        define: {
            freezeTableName: true,
        }
    });

    setupModels(sequelize);

    testBelongsTo().then(() => {
        return testHasOne();
    }).then(() => {
        process.exit(0);
    });
}


function testBelongsTo() {
    PlayerExtended.belongsTo(Player, {
        foreignKey: 'playerOtherId',
        targetKey: 'otherId'
    });

    return PlayerExtended.findAll({ include: [Player] }).then(exts => {
        console.log(exts[0].player);
    });
}


function testHasOne() {
    Player.hasOne(PlayerExtended, {
        foreignKey: 'playerOtherId',
        sourceKey: 'otherId'
    });

    return Player.findAll({ include: [PlayerExtended] }).then(players => {
        console.log(players[0].player_ext);
    });
}


function setupModels(sequelize) {
    Player = sequelize.define('player', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },

        otherId: {
            type: Sequelize.STRING,
            field: 'other_id',
        },

        firstName: {
            type: Sequelize.STRING,
            field: 'first_name'
        },

        lastName: {
            type: Sequelize.STRING,
            field: 'last_name'
        }
    });

    PlayerExtended = sequelize.define('player_ext', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },

        playerId: {
            type: Sequelize.INTEGER,
            field: 'player_id',
            references: {
                model: 'player',
                key: 'id'
            }
        },

        playerOtherId: {
            type: Sequelize.STRING,
            field: 'player_other_id'
        },

        age: Sequelize.INTEGER,

        eyeColor: {
            type: Sequelize.STRING,
            field: 'eye_color'
        }
    });
}
