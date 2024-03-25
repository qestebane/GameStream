//
//  ContentView.swift
//  HelloiOS
//
//  Created by Elizabeth Quispe on 8/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {

            Spacer(minLength: 10)
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity:1.0).ignoresSafeArea()
            
            VStack {
                
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 40)
                
                InicioYRegistroView()
            }
            
        }
    }
}

struct InicioYRegistroView: View {
    
    @State var tipoInicioSesion = true
    
    var body: some View {
        
        HStack{
            
            Spacer()
            Button("INICIA SESIÓN"){
                tipoInicioSesion = true
                print("Pantalla inicio session")
            }.foregroundColor(tipoInicioSesion ? .white: .gray)
            Spacer()
            
            Button("REGISTRATE"){
                tipoInicioSesion = false
                print("Pantalla de registro")
            }.foregroundColor(tipoInicioSesion ? .gray: .white)
            
            Spacer()
        }
        
        Spacer(minLength: 42)
        if tipoInicioSesion == true {
            InicioSesionView()
        }else {
            RegistroView()
        }
    }
}

struct InicioSesionView: View {
    
    @State var correo = ""
    @State var password = ""
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                Text("Correo Electronio").foregroundColor(Color("Dark-Ciam"))
                
                ZStack(alignment:.leading){
                    
                    if correo.isEmpty{
                        Text("eliza@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo).colorInvert()
                }
                
            }
            Divider().frame(height: 1).background(Color("Dark-Ciam")).padding(.bottom)
            
            ZStack(alignment:.leading){
                if password.isEmpty{
                    Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                }
                SecureField("", text: $password)
            }
            Divider().frame(height: 1).background(Color("Dark-Ciam")).padding(.bottom)
            
            
            
        }.padding(.horizontal, 77.0)
    }
}

struct RegistroView: View {
    var body: some View {
        Text("Registrate").colorInvert()
    }
}

struct Content_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("pantalla1").resizable()
    }
}
