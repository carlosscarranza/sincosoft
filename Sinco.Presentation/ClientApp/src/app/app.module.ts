import { BrowserModule } from "@angular/platform-browser";
import { NgModule } from "@angular/core";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { HttpClientModule } from "@angular/common/http";
import { RouterModule } from "@angular/router";
import { AppComponent } from "./app.component";
import { NavMenuComponent } from "./nav-menu/nav-menu.component";
import { HomeComponent } from "./home/home.component";
import { CounterComponent } from "./counter/counter.component";
import { FetchDataComponent } from "./fetch-data/fetch-data.component";
import { AlumnoComponent } from "./alumno/alumno.component";
import { RegistroComponent } from "./registro/registro.component";
import { RegistroService } from "./registro/registro.service";
import { ProfesorComponent } from "./profesor/profesor.component";
import { MateriaComponent } from "./materia/materia.component";
import { RegistroProfesorMateriaComponent } from "./registro-profesor-materia/registro-profesor-materia.component";
import { RegistroAlumnoMateriaComponent } from "./registro-alumno-materia/registro-alumno-materia.component";
import { ProfesorDeleteComponent } from "./profesor-delete/profesor-delete.component";
import { AlumnoEditComponent } from "./alumno-edit/alumno-edit.component";
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RegistroDialogComponent } from "./registro-dialog/registro-dialog.component";
import { MatDialogModule } from "@angular/material/dialog";


@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    FetchDataComponent,
    AlumnoComponent,
    RegistroComponent,
    ProfesorComponent,
    MateriaComponent,
    RegistroProfesorMateriaComponent,
    RegistroAlumnoMateriaComponent,
    ProfesorDeleteComponent,
    AlumnoEditComponent,
    RegistroDialogComponent
  ],
    imports: [
    BrowserModule.withServerTransition({ appId: "ng-cli-universal" }),
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MatDialogModule,
    BrowserAnimationsModule,
    RouterModule.forRoot([
      { path: "", component: HomeComponent, pathMatch: "full" },
      { path: "counter", component: CounterComponent },
      { path: "fetch-data", component: FetchDataComponent },
      { path: "alumno", component: AlumnoComponent },
      { path: "registro", component: RegistroComponent },
      { path: "profesor", component: ProfesorComponent },
      { path: "materia", component: MateriaComponent },
      { path: "registro-profesor-materia", component: RegistroProfesorMateriaComponent },
      { path: "registro-alumno-materia", component: RegistroAlumnoMateriaComponent },
      { path: "profesor-delete", component: ProfesorDeleteComponent },
      { path: "alumno-edit", component: AlumnoEditComponent }
    ])
    ],
    entryComponents: [RegistroComponent, RegistroDialogComponent],
    providers: [RegistroService],
    bootstrap: [AppComponent]
})
export class AppModule { }
