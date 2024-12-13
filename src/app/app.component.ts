import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {environment} from '../environments/environment';
environment
@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'portfolio';
  apiUrl: string = environment.apiUrl;
}
