import * as React from 'react';
import axios from "axios";

export class TeacherBody extends React.Component {

    constructor(props) {
        super(props);

        axios.get('http://0.0.0.0:3000/subjects') .then(res => {
            // localStorage.setItem('subjects', JSON.stringify(res.data));
            this.setState({subjects: res.data});
        });
    }
    state = {
        name: "",
        time: "08:15",
        subjects: []
    };

    handleName = (event) => {
        this.setState({name: event.target.value});
    }

    handleTime = (event) => {
        this.setState({time: event.target.value});
    }

    delete = (id) => {
        const subjects = [...this.state.subjects];
        const subject = subjects[id];
        subjects.splice(id, 1);
        localStorage.setItem('subjects', JSON.stringify(subjects));
        axios.post(`http://0.0.0.0:3000/subject/delete`, {id: subject.id})
            .then(res => {
                console.log(res)
            });
        this.setState({subjects});
    };

    handleClick = () => {
        if(
            this.state.name !==  "" &&
            this.state.time !== ""
        ) {
            const subjects = [...this.state.subjects];
            const { name, time } = this.state;
            // localStorage.setItem('subjects', JSON.stringify(subjectsLocal));
            const currentUser = JSON.parse(localStorage.getItem('current_user'));
            subjects.push({ name, time, teacher_id: currentUser.id });
            axios.post(`http://0.0.0.0:3000/subject/create`, {name, time, id: currentUser.id});
            this.setState({subjects})
        }
    };

    render() {
        const currentUser = JSON.parse(localStorage.getItem('current_user'));
        let subjects = [...this.state.subjects];
        let subList;
        if(subjects){
            subList = subjects.map((item, index) => {
                if(item.teacher_id === currentUser.id) {
                    return (
                        <tr key={index}>
                            <td>{item.name}</td>
                            <td>{item.time}</td>
                            <td>
                                <button onClick={() => this.delete(index)}>❌</button>
                            </td>
                        </tr>
                    );
                }
            });
        }else{
            subList = "Empty 😥";
        }
        return (
            <div className="TeacherBody home-body">
                <div className="TeacherBody-container">
                    <div className="welcome-user">
                        Sveiki, {currentUser.name} {currentUser.last_name} 🤘!
                    </div>
                    <div className="TeacherBody-add-subject">
                        <h1>Pridėti dalyką 📚</h1>
                        <input type="email" placeholder="Pavadinimas" className="input input-text" value={this.state.name} onChange={(e) => this.handleName(e)}/>
                        <input type="text" placeholder="Laikas" className="input input-text" value={this.state.time} onChange={(e) => this.handleTime(e)}/>
                        <button className="btns btn-login" onClick={this.handleClick}>Pridėti ✅</button>
                    </div>
                    <div className="TeacherBody-subjects">
                        <h1>Visi jūsų dalykai:</h1>
                        <table className="table">
                            <thead>
                            <tr>
                                <th scope="col">Pavadinimas</th>
                                <th scope="col">Laikas</th>
                                <th scope="col">Ištrinti</th>
                            </tr>
                            </thead>
                            <tbody>
                                {subList}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        );
    }
}
