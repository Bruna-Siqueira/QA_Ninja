import chai from 'chai';
import chaiHttp from 'chai-http';
import taskModel from '../models/task';

chai.use(chaiHttp);

// Importando a aplicação que será testada
const app = require('../app');
// O .agent é para que a conexão com a aplicação seja mantida em todos os cenários.
// Removendo esse .agent, o chai mata a conexão depois do primeiro cenário.
const request = chai.request.agent(app);
const expect = chai.expect;

describe('get', () => {

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

        it('deve filtrar por palavra chave', (done) => {
            request
                .get('/task')
                .query({ title: 'Estudar' })
                .end((err, res) => {
                    expect(res).to.has.status(200);
                    expect(res.body.data[0].title).to.equal('Estudar MongoDB');
                    expect(res.body.data[1].title).to.equal('Estudar NodeJS');
                    done();
                })
        })
    })

    context('quando busco por id', () => {

        it('deve retornar uma única tarefa', (done) => {
            let tasks = [
                { title: 'Ler um livro de Javascript', owner: 'bruna@siqueira.io', done: false },
            ]
            // Insere a lista task no banco
            taskModel.insertMany(tasks, (err, result) => {
                // Pega o id de retorno do banco
                let id = result[0]._id
                // Faz um request pelo id
                request
                    .get('/task/' + id)
                    .end((err, res) => {
                        expect(res).to.has.status(200);
                        expect(res.body.data.title).to.equal(tasks[0].title);
                        done();
                    })
            })
        })
    })

    context('quando o id não existe', () => {

        it('deve retornar 404', (done) => {
            // Cria um id do mongodb que não existe no banco
            let id = require('mongoose').Types.ObjectId();
            // Faz um request pelo id
            request
                .get('/task/' + id)
                .end((err, res) => {
                    expect(res).to.has.status(404);
                    // O eql valida os valores e o equal valida os tipos também
                    expect(res.body).to.eql({});
                    done();
                })
        })
    })
})