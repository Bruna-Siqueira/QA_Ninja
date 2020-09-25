import chai from 'chai';
import chaiHttp from 'chai-http';

chai.use(chaiHttp);
// importando a aplicação no teste automatizado
const app = require("../app");
const request = chai.request(app);

// Para testar uma URL externa:
//const request = chai.request("http://localhost:3000")

const expect = chai.expect;

describe("suite", () => {

    it("meu primeiro teste", () => {
        expect(1).to.equals(1);
        console.log("meu primeiro teste.");
    })

    it("deve retornar mensagem olá", (done) => {
        request
            .get("/hello")
            .end((err, res) => {
                expect(res.body.message).to.equals("Olá, Nodejs com express!");
                done();
            })
    })
})