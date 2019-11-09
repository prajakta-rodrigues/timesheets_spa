import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Switch, Route, NavLink, Link } from 'react-router-dom';
import { Navbar, Nav , Col} from 'react-bootstrap';
import { Provider, connect } from 'react-redux';
import Login from './login';

export default function init_page(root, store) {
  ReactDOM.render(<Provider store={store}>
    <Page />
    </Provider>, root);
}

let Page = connect(({session}) => ({session}))(({session, dispatch}) => {

    if (!session){
      return <Router>
              <div>
                  <Login />
                </div>
              </Router>;

    } else {
    return(
        <Router>
          <div>
              <Navbar bg="dark" variant="dark">
          <Col md="8">
            <Nav>
              <Nav.Item>
                <NavLink to="/" exact activeClassName="active" className="nav-link">
                  Home
                </NavLink>
              </Nav.Item>
            </Nav>
          </Col>
          <Col md="4">
            <Nav.Item>
              <NavLink to="/" exact activeClassName="active" className="nav-link">
                Logout
              </NavLink>
            </Nav.Item>
          </Col>
        </Navbar>
            <div className="row">
              <Route path="/" exact={true} render={() =>
                  <div className="col">
                    <p>&nbsp;</p>
                    <h2>Welcome to the application</h2>
                  </div>
                }
                />

              <Route path="/requests" exact={true} render={() =>
                  <div className="col">
                    <h2>My Requests</h2>
                  </div>
                }
                />
              <Route path="/requests/:request_id" exact={true} render={({match}) =>
                    <div className="col">
                      <h2>Tasks</h2>
                      <h4>{match.params.request_id}</h4>
                    </div>
                  }
                  />

            <Route path="/tasks/:task_id" exact={true} render={({match}) =>
                <div className="col">
                  <p>&nbsp;</p>
                  <h2>Edit Task</h2>
                  <h4>{match.params.task_id}</h4>
                </div>
              }
              />

          </div>
        </div>
      </Router>
    );
  }
});
