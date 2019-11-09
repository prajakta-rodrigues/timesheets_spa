import store from './store';

export function post(path, body) {
  let state = store.getState();
  let token = "";
  if(state.session) {
    token = state.session.token
  }


  return fetch('/api' + path, {
    method: 'post',
    credentials: 'same-origin',
    headers: new Headers({
      'x-csrf-token': window.csrf_token,
      'content-type': "application/json; charset=UTF-8",
      'accept': 'application/json',
      'x-auth': token || "",
    }),
    body: JSON.stringify(body),
  }).then((resp) => resp.json());
}


export function submit_login(form) {
  let state = store.getState();
  let data = state.forms.login;

  post('/token', data)
    .then((resp) => {
      if (resp.token) {
        localStorage.setItem('session', JSON.stringify(resp));
        form.redirect('/');
      }
      else {
        store.dispatch({
          type: 'CHANGE_LOGIN',
          data: {errors: JSON.stringify(resp.errors)},
        });
      }
    });
}
