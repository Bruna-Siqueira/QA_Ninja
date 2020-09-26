import chai from 'chai';
import chaiHttp from 'chai-http';
import taskModel from '../models/task';

chai.use(chaiHttp);

// Importando a aplicação que será testada
const app = require('../app');
const request = chai.request(app);
const expect = chai.expect;

describe('get', () => {

    before((done) => {
        taskModel.deleteMany({});
        done();
    })

    context('quando eu tenho tarefas cadastradas', () => {

        before((done) => {
            let tasks = [
                { title: 'Estudar NodeJS', owner: 'bruna@siqueira.io', done: false },
                { title: 'Fazer compras', owner: 'bruna@siqueira.io', done: false },
                { title: 'Estudar MongoDB', owner: 'bruna@siqueira.io', done: true }
            ]

            // Insere a lista tasks no banco
            taskModel.insertMany(tasks);
            done();
        })

        it('deve retornar uma lista', (done) => {
            request
                .get('/task')
                .end((err, res) => {
                    expect(res).to.has.status(200);
                    expect(res.body.data).to.be.an('array');
                    done();
                })
        })
    })
})