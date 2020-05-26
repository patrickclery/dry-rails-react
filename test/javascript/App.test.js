import React from 'react'
import { shallow, mount, render } from 'enzyme'
import { expect } from 'chai';

/* On spec/javascript/setupTests.js */
import Enzyme from 'enzyme'
import EnzymeAdapter from 'enzyme-adapter-react-16'
Enzyme.configure({ adapter: new EnzymeAdapter() })

require('jest-fetch-mock').enableMocks()

import App from '../../app/javascript/components/App.jsx'

describe('<App />', () => {

  it('fetches the list of todos', () => {
    const wrapper = mount(<App />); // 5
    expect(wrapper.text()).to.contain('todo')
  })
})