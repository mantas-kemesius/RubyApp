import * as React from 'react';
import axios from "axios";

export class TeacherBody extends React.Component {

    constructor(props) {
        super(props);

        axios.get('http://0.0.0.0:3000/subjects') .then(res => {
            // localStorage.setItem('subjects', JSON.stringify(res.data));
            this.setState({subjects: res.data});
        });
        axios.get('http://0.0.0.0:3000/users') .then(res => {
            // localStorage.setItem('subjects', JSON.stringify(res.data));
            this.setState({users: res.data});
            // this.setState({subjects: res.data});
        });
        axios.get('http://0.0.0.0:3000/messages') .then(res => {
            // localStorage.setItem('subjects', JSON.stringify(res.data));
            this.setState({messages: res.data});
            // this.setState({subjects: res.data});
        });
        axios.get('http://0.0.0.0:3000/ssubjects') .then(res => {
            // localStorage.setItem('subjects', JSON.stringify(res.data));
            this.setState({student_subjects: res.data});
            // this.setState({subjects: res.data});
        });
    }
    state = {
        name: "",
        time: "08:15",
        email: "",
        student_email: "",
        message: "",
        subject_name: "",
        subjects: [],
        messages: [],
        users: [],
        student_subjects: []
    };

    handleEmail = (event) => {
        this.setState({email: event.target.value});
    }

    handleStudentEmail = (event) => {
        this.setState({student_email: event.target.value});
    }

    handleMessage = (event) => {
        this.setState({message: event.target.value});
    }

    handleName = (event) => {
        this.setState({name: event.target.value});
    }

    handleTime = (event) => {
        this.setState({time: event.target.value});
    }

    handleSubjectName = (event) => {
        this.setState({subject_name: event.target.value});
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

    sendMessage = () => {
        if(
            this.state.email !==  "" &&
            this.state.message !== ""
        ) {
            const users = [...this.state.users];
            const { email, message } = this.state;
            const user = users.filter(item => email === item.email);

            const { id } = user[0];

            const currentUser = JSON.parse(localStorage.getItem('current_user'));
            axios.post(`http://0.0.0.0:3000/message/create`, {
                from: currentUser.id, to: id, text: message
            });
            this.setState({email: "", message: ""})
        }
    };

    addSubject = () => {
        if(
            this.state.student_email !==  "" &&
            this.state.student_subjects !== ""
        ) {
            const users = [...this.state.users];
            const { student_email, subject_name } = this.state;
            const user = users.filter(item => student_email === item.email);
            console.log(user);
            const { id } = user[0];

            const subject = this.state.subjects.filter(item => subject_name === item.name);

            const subject_id = subject[0].id;

            axios.post(`http://0.0.0.0:3000/ssubjects/create`, {
                student_id: id, subject_id: subject_id
            });
            this.setState({student_email: "", subject_name: ""})
        }
    };

    getUser = (id) => {
      const user = this.state.users.filter(item => id === item.id);

      return user[0];
    };

    render() {
        const currentUser = JSON.parse(localStorage.getItem('current_user'));
        let subjects = [...this.state.subjects];
        let subList, usersList, studentList, messages, ssubList;

        if(this.state.users){
            usersList = this.state.users.map((item, index) => {
                if(currentUser.id !== item.id) {
                    return (
                        <li key={index}>{item.email}</li>
                    );
                }
            });
        }

        if(this.state.users){
            studentList = this.state.users.map((item, index) => {
                if(currentUser.id !== item.id && item.role === 'ROLE_STUDENT') {
                    return (
                        <li key={index}>{item.email}</li>
                    );
                }
            });
        }

        if(this.state.messages){
            messages = this.state.messages.map((item, index) => {
                if(item.to === currentUser.id) {
                    // console.log(item.from);
                    const user = this.getUser(item.from);
                    // console.log(user.email);
                    return (
                        <tr key={index}>
                            <td>{user.email}</td>
                            <td>{item.text}</td>
                        </tr>
                    );
                }
            });
        }

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
                    <div className="TeacherBody-message">
                        <h1>Vartotojai</h1>
                        <ul>
                            {usersList}
                        </ul>
                        <h1>Išsiusti laišką</h1>
                        <input type="email" placeholder="Kam" className="input input-text" value={this.state.email} onChange={(e) => this.handleEmail(e)}/>
                        <input type="text" placeholder="Žinutė" className="input input-text" value={this.state.message} onChange={(e) => this.handleMessage(e)}/>
                        <button className="btns btn-login" onClick={this.sendMessage}>Siūsti</button>
                    </div>
                    <div className="TeacherBody-ssubject">
                        <h1>Studentai</h1>
                        <ul>
                            {studentList}
                        </ul>
                        <h1>Pridėti studentui naują dalyką</h1>
                        <input type="email" placeholder="Kam" className="input input-text" value={this.state.student_email} onChange={(e) => this.handleStudentEmail(e)}/>
                        <input type="text" placeholder="Dalykas" className="input input-text" value={this.state.subject_name} onChange={(e) => this.handleSubjectName(e)}/>
                        <button className="btns btn-login" onClick={this.addSubject}>Pridėti</button>
                    </div>
                    <div className="TeacherBody-ssubject">
                        <h1>Žinutės</h1>
                        <table className="table">
                            <thead>
                            <tr>
                                <th scope="col">Nuo</th>
                                <th scope="col">Žinutė</th>
                            </tr>
                            </thead>
                            <tbody>
                            {messages}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        );
    }
}
