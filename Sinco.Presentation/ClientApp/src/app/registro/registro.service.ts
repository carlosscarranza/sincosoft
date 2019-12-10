import { Injectable, Inject } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import { IRegistro } from './registro';
import { IAlumno } from '../alumno/alumno';
import { IProfesor } from "../profesor/profesor";
import { IMateria } from "../materia/materia";
import { IRegistroProfesorMateria } from "../registro-profesor-materia/registro-profesor-materia";
import { IRegistroAlumnoMateria } from "../registro-alumno-materia/registro-alumno-materia";
import { IDetalleRegistro } from '../registro-dialog/detalle-registro';


@Injectable()
export class RegistroService {

    private baseUrl = "https://localhost:44389";
    private controller = "/api/home/";

    private apiUrlReport = this.baseUrl + this.controller + "GetReportStudent";

    private apiUrlCreateStudent = this.baseUrl + this.controller + "CreateStudent";
    private apiUrlCreateTeacher = this.baseUrl + this.controller + "CreateTeacher";
    private apiUrlCreateSubject = this.baseUrl + this.controller + "CreateSubject";
    private apiUrlCreateTeacherSubject = this.baseUrl + this.controller + "CreateRecordTeacherSubject";
    private apiUrlCreateStudentSubject = this.baseUrl + this.controller + "CreateRecordStudentSubject";

    private apiUrlGetTeachers = this.baseUrl + this.controller + "GetTeachers";
    private apiUrlGetSubjects = this.baseUrl + this.controller + "GetSubjects";
    private apiUrlGetAllStudent = this.baseUrl + this.controller + "GetAllStudent";
    private apiUrlGetStudent = this.baseUrl + this.controller + "GetStudent";
    private apiUrlGetSubjectsRegistered = this.baseUrl + this.controller + "GetAllSubjectsRegistered";

    private apiUrlDeleteTeacher = this.baseUrl + this.controller + "DeleteTeacher";

    private apiUrlUpdateStudent = this.baseUrl + this.controller + "UpdateStudent";
    private apiUrlUpdateDetailRecordStudentSubject = this.baseUrl + this.controller + "UpdateDetailRecordStudentSubject";

    constructor(private http: HttpClient) { }

    updateAlumno(alumno: IAlumno): Observable<number> {
        return this.http.put<number>(this.apiUrlUpdateStudent, alumno);
    }

    updateDetalleRegistro(detRegistro: IDetalleRegistro): Observable<number> {
        return this.http.put<number>(this.apiUrlUpdateDetailRecordStudentSubject, detRegistro);
    }

    getRegistro(id:number): Observable<IRegistro[]> {
        return this.http.get<IRegistro[]>(this.apiUrlReport + "/" + id);
    }

    getAlumno(id: number): Observable<IAlumno> {
        return this.http.get<IAlumno>(this.apiUrlGetStudent + "/" + id);
    }

    getProfesores(): Observable<IProfesor[]> {
        return this.http.get<IProfesor[]>(this.apiUrlGetTeachers);
    }

    getMaterias(): Observable<IMateria[]> {
        return this.http.get<IMateria[]>(this.apiUrlGetSubjects);
    }

    getMateriasRegistradas(): Observable<IMateria[]> {
        return this.http.get<IMateria[]>(this.apiUrlGetSubjectsRegistered);
    }

    getAlumnos(): Observable<IAlumno[]> {
        return this.http.get<IAlumno[]>(this.apiUrlGetAllStudent);
    }

    createAlumno(alumno: IAlumno): Observable<IAlumno> {
        console.log(alumno);
        return this.http.post<IAlumno>(this.apiUrlCreateStudent, alumno);
    }

    createProfesor(profesor: IProfesor): Observable<IProfesor> {
        console.log(profesor);
        return this.http.post<IProfesor>(this.apiUrlCreateTeacher, profesor);
    }

    createMateria(materia: IMateria): Observable<IMateria> {
        console.log(materia);
        return this.http.post<IMateria>(this.apiUrlCreateSubject, materia);
    }

    createProfesorMateria(profesormateria: IRegistroProfesorMateria): Observable<IRegistroProfesorMateria> {
        console.log(profesormateria);
        return this.http.post<IRegistroProfesorMateria>(this.apiUrlCreateTeacherSubject, profesormateria);
    }

    createAlumnoMateria(alumnomateria: IRegistroAlumnoMateria): Observable<IRegistroAlumnoMateria> {
        console.log(alumnomateria);
        return this.http.post<IRegistroAlumnoMateria>(this.apiUrlCreateStudentSubject, alumnomateria);
    }

    deleteProfesor(id: number): Observable<number> {
        return this.http.get<number>(this.apiUrlDeleteTeacher + "/" + id[0]);
    }
}
