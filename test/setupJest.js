import React from 'react'
import { shallow, mount, render } from 'enzyme'

/* On spec/javascript/setupTests.js */
import Enzyme from 'enzyme'
import EnzymeAdapter from 'enzyme-adapter-react-16'
Enzyme.configure({ adapter: new EnzymeAdapter() })

import {expect, describe} from "@jest/globals"

require('jest-fetch-mock').enableMocks()
