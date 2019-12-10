import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfesorDeleteComponent } from './profesor-delete.component';

describe('ProfesorDeleteComponent', () => {
  let component: ProfesorDeleteComponent;
  let fixture: ComponentFixture<ProfesorDeleteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfesorDeleteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfesorDeleteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
