/* eslint-disable max-len */
/* eslint-disable consistent-return */
/* eslint-disable no-console */
import * as userService from '../services/userService.js';

export async function signUp(req, res) {
  try {
    const {
      name, email, password, confirmPassword, company, position, photo,
    } = req.body;

    const bodyIsValid = await userService.signUpDataIsValid(name, email, password, confirmPassword);
    if (!bodyIsValid) return res.sendStatus(400);

    const userExists = await userService.userExists(email);
    if (userExists !== false) return res.sendStatus(409);

    const hash = await userService.createHash(password);

    const createNewUser = await userService.newUser(name, email, hash, company, position, photo);
    if (!createNewUser) return res.sendStatus(503);

    return res.sendStatus(201);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
}

export async function signIn(req, res) {
  try {
    const { email, password } = req.body;

    const bodyIsValid = await userService.signInDataIsValid(email, password);
    if (!bodyIsValid) return res.sendStatus(400);

    const userExists = await userService.userExists(email);
    if (!userExists) return res.sendStatus(401);

    const userId = userExists[0].id;
    const userPassword = userExists[0].password;
    const token = await userService.generateToken(password, userPassword);
    if (token === false) return res.sendStatus(401);

    const createSession = await userService.newSession(userId, token);
    if (!createSession) return res.sendStatus(503);

    const data = await userService.userData(token);

    res.send(data).status(200);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
}

export async function logout(req, res) {
  try {
    const authorization = req.header('Authorization');
    const token = authorization?.replace('Bearer ', '');

    if (!token) return res.sendStatus(401);

    const deleteSession = await userService.finishSession(token);
    if (!deleteSession) return res.sendStatus(503);

    return res.sendStatus(200);
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
}
