import Button from 'react-bootstrap/Button'
import Form from 'react-bootstrap/Form'
import {Link} from 'react-router-dom'
import Select from 'react-select';
import { JOBFIELD } from '../../contexts/constants'

const EmployerRegisterForm =() =>{

    let body
    
    body = (
        <>
        <div className="grid login-grid main login-box">
            <div className='ute-title'>
                <h3>Sign up to continue!</h3>
                <div className='login-social'></div>
                <span className='ute-login-sml-text'>Please enter your business information</span>
            </div>
            <Form className='my-4' id='form-login'>
                <Form.Group>
                    <Form.Label>Name</Form.Label>
                    <Form.Control type='text' placeholder='' name='Name' required/>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Phone</Form.Label>
                    <Form.Control type='text' placeholder='' name='Phone' required/>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Addess </Form.Label>
                    <Form.Control type='password' placeholder='' name='Addess' required/>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Field </Form.Label>
                    <Select options={ JOBFIELD } />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Email</Form.Label>
                    <Form.Control type='text' placeholder='' name='username' required/>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Password</Form.Label>
                    <Form.Control type='password' placeholder='' name='password' required/>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Confirm password</Form.Label>
                    <Form.Control type='password' placeholder='' name='confirmPassword' required/>
                </Form.Group>
                <Button className='mt-2' variant='success' type='submit'>Register</Button>

            </Form>
            <p> Aready have an account?
                <Link to='/employer/login'>
                    Login
                </Link>
            </p>
            <Link to='/user/register'>
                <Button variant='info' >Create an employee account</Button>
            </Link>
        </div>
        </>
    )
    
    return (
        <>
        {/*Header,logo*/}
        <div className="utew-login-top-header">
            <div className='logo-box-login'>
                <Link className='link-to-dashboard-36' to='/dashboard'>EMPLOYER</Link>
            </div>
        </div>
        {/*Form login*/}
        {body}
    
        
        </>
    )
}
export default EmployerRegisterForm