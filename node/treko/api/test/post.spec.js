import chai from 'chai';
import chaiHttp from 'chai-http';
import taskModel from '../models/task';

chai.use(chaiHttp);

const app = require('../app');
const request = chai.request.agent(app);
const expect = chai.expect;

describe('post', () => {

    context('quando eu cadastro uma tarefa', () => {

        let task = { title: 'Estudar Mongoose', owner: 'eu@papito.io', done: false }

        it('então deve retornar 200', (done) => {
            request
                .post('/task')
                .send(task)
                .end((err, res) => {
                    expect(res).to.has.status(200);
                    expect(res.body.data.title).to.be.an('string')
                    expect(res.body.data.owner).to.be.an('string')
                    expect(res.body.data.done).to.be.an('boolean')
                    done();
                })
        })
    })

    context('quando não informo o titulo', () => {

        let task = { title: '', owner: 'eu@papito.io', done: false }

        it('então deve retornar 400', (done) => {
            request
                .post('/task')
                .send(task)
                .end((err, res) => {
                    expect(res).to.has.status(400);
                    expect(res.body.errors.title.message).to.eql('Oops! Title is required.');
                    done();
                })
        })
    })

    context('quando não informo o owner', () => {

        let task = { title: 'Nova tarefa', owner: '', done: false }

        it('então deve retornar 400', (done) => {
            request
                .post('/task')
                .send(task)
                .end((err, res) => {
                    expect(res).to.has.status(400);
                    expect(res.body.errors.owner.message).to.eql('Oops! Owner is required.');
                    done();
                })
        })
    })

    context('quando a tarefa já existe', () => {

        let task = { title: 'Planejar viagem para a China', owner: 'eu@papito.io', done: false }

        before((done) => {
            request
                .post('/task')
                .send(task)
                .end((err, res) => {
                    expect(res).to.has.status(200);
                    done();
                })
        })

        it('então deve retornar 409', (done) => {
            request
                .post('/task')
                .send(task)
                .end((err, res) => {
                    expect(res).to.has.status(409);
                    console.log(res.error);
                    console.log(res.body.errmsg);
                    //expect(res.body.errmsg).to.include('duplicate key');
                    done();
                })
        })
    })
})