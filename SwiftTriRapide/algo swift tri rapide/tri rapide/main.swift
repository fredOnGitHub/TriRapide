//
//  main.swift
//  tri rapide
//
//  Created by frédéric carpon on 06/05/2020.
//  Copyright © 2020 frederic carpon. All rights reserved.
//


import Foundation

var nb_swap=0

func quicksort_dernier_elt(_ A: inout Array<String>,_ lo: Int,_ hi:Int){
//    print("quickSort lo",lo,"hi",hi)
//    affiche_tab(Tab: A, Nb:10)
    if (lo < hi) {
        let p = partition_dernier_elt(&A, lo, hi)
//        print("quicksort_dernier_elt",lo,p-1,"et",p + 1, hi)
        quicksort_dernier_elt(&A, lo, p - 1)
        quicksort_dernier_elt(&A, p + 1, hi)
    }
}

func partition_dernier_elt(_ A: inout Array<String> ,_ lo: Int,_ hi:Int)->Int{
    let pivot = A[hi]
    var i = lo
    for j in lo..<hi{
//        print("j",j,terminator: " ")
//        print("compare_string",A[j],pivot, terminator: " ")
        let r = strcmp(A[j], pivot)
//        print("  cp = ",r, terminator: " ")
        
        if (r < 0){
//            print("Échanger",A[i], A[j], terminator: " ")
            A.swapAt(i,j)
            nb_swap+=1
            i+=1
        }
//        print("")
    }
//    print("Échanger",A[i], A[hi])
    nb_swap+=1
    A.swapAt(i,hi)
    return i;
}
func quicksort_dernier_elt_2(_ A: inout Array<Array<CChar>>,_ lo: Int,_ hi:Int){
//    print("quickSort_2 lo",lo,"hi",hi)
//    affiche_Array_Array_CChar(Tab: A, Nb: 10)
    if (lo < hi) {
        let p = partition_dernier_elt_2(&A, lo, hi)
//        print("qs2",lo,p-1,"   et    ",p + 1, hi)
        quicksort_dernier_elt_2(&A, lo, p - 1)
        quicksort_dernier_elt_2(&A, p + 1, hi)
    }
}
func ecris(_ s:String, _ a:Array<CChar>, _ b:Array<CChar>){
    print(s, terminator: "")
    affiche_Array_CChar(a)
    print(" et ", terminator: "")
    affiche_Array_CChar(b)
}
func partition_dernier_elt_2(_ A: inout Array<Array<CChar>> ,_ lo: Int,_ hi:Int)->Int{
    let pivot = A[hi]
    var i = lo
    for j in lo..<hi{
//        print("j",j,terminator: " ")
//        ecris("compare ", A[j], pivot)
        let r = strcmp(A[j], pivot)
//        print(" : ",r, terminator: " ")
        
        if (r < 0){
//            ecris("    Échanger ", A[j], A[j])
            A.swapAt(i,j)
            nb_swap+=1
            i+=1
        }
//        print("")
    }
//    ecris("Échanger ", A[i], A[hi])
//    print("")
    nb_swap+=1
    A.swapAt(i,hi)
    return i;
}
func affiche_tab(Tab: Array<String>, Nb: Int) -> Void {
    var i = Nb
    if i > Tab.count{
        i = Tab.count
    }
    for k in 0..<i{
        print(Tab[k], terminator: " ")
    }
    print("")
}



func donne_Array_CChar_de(_ s:String) -> Array<CChar>{
    var tc: Array<CChar> = Array()
    for c in s.utf8CString{
        tc.append(c)
    }
    return tc
}
func tab_string_vers_Array_Array_CChar(_ a:Array<String>) -> Array<Array<CChar>>{
    var t: Array<Array<CChar>> = Array()
    for s in a{
        t.append(donne_Array_CChar_de(s))
    }
    return t
}

func affiche_tab_de_tab_de_cchar (Tab: Array<Array<CChar>>, Nb: Int) {
    if Nb > 0 && Tab.count > 0{
        var n = Nb
        if n > Tab.count{
            n = Tab.count
        }
        for i in 0..<n{
//            print("Tab[\(i)] : ",terminator: "")
            for k in 0..<Tab[i].count-1{
                let y = Int(Tab[i][k])
                let sc = Unicode.Scalar(y)!
                print("\(sc)",terminator: "")
//                print("\(sc)",terminator: "")
            }
            print(" ",terminator: "")
        }
        print()
    }
}
func affiche_Array_CChar(_ Tab:Array<CChar>){
    if !Tab.isEmpty{
        for i in 0..<Tab.count-1{
            let y = Int(Tab[i])
            let sc = Unicode.Scalar(y)!
            print("\(sc)",terminator: "")
        }
    }
}
func affiche_Array_Array_CChar (Tab: Array<Array<CChar>>, Nb: Int) {
    if Nb > 0 && Tab.count > 0{
        var n = Nb
        if n > Tab.count{
            n = Tab.count
        }
        for i in 0..<n{
            affiche_Array_CChar(Tab[i])
            print(terminator: " ")
        }
        print()
    }
}
let f = "nombres_aleatoires_50_000.txt"
//let f = "a.txt"
var homeDirURL = FileManager.default.homeDirectoryForCurrentUser
homeDirURL.appendPathComponent(f)
if FileManager.default.fileExists(atPath: homeDirURL.path){
    let file: FileHandle? = FileHandle(forReadingAtPath: homeDirURL.path)
    
    if file != nil {
        
        do {
            print("Contenu du ficher dans String...", terminator: " ")
            var t = clock()
            let file = try String(contentsOfFile: homeDirURL.path)
//            print("file",file)
//            print("Type of file : ", type(of:file) , terminator: "\n")
            print("\(Double(clock() - t) / Double(CLOCKS_PER_SEC))s")
            print("Création de [String] <- file.components...", terminator: " ")
            t = clock()
            var text: [String] = file.components(separatedBy: "\n")
            print("\(Double(clock() - t) / Double(CLOCKS_PER_SEC))s")
            print("Création de Array<Array<CChar>> <- [String]...", terminator: " ")
            t = clock()
            var ttcchar = tab_string_vers_Array_Array_CChar(text)
            print("\(Double(clock() - t) / Double(CLOCKS_PER_SEC))s")
            
            
            print("\n\nTrier le tableau Array<Array<CChar>> avec la fonction manuelle...", terminator: "\n")
            nb_swap=0
            print("Taille ttcchar:",ttcchar.count)
            affiche_Array_Array_CChar(Tab: ttcchar, Nb: 10)
            print("Tri ...",terminator: " ")
            t = clock()
            quicksort_dernier_elt_2(&ttcchar, 0, ttcchar.count-1)
            print("\(Double(clock() - t) / Double(CLOCKS_PER_SEC))s")
            affiche_Array_Array_CChar(Tab: ttcchar, Nb: 10)
            print("Nombre d'échanges : ",nb_swap)
            
            
            print("\n\nTrier le tableau Array<String> avec la fonction manuelle ...", terminator: "\n")
            print("Taille text:",text.count)
            affiche_tab(Tab: text, Nb:10)
            nb_swap=0
            print("Tri ...",terminator: " ")
            t = clock()
            quicksort_dernier_elt( &text, 0, text.count-1)
            print("\(Double(clock() - t) / Double(CLOCKS_PER_SEC))s")
            affiche_tab(Tab: text, Nb:10)
            print("Nombre d'échanges : ",nb_swap)


            print("\n\nTrier le tableau avec sorted ...", terminator: "\n")
            text = file.components(separatedBy: "\n")
            print("Taille text:",text.count)
            affiche_tab(Tab: text, Nb:10)
            print("Tri ...",terminator: " ")
            t = clock()
//            let r2 = text.sorted { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
            let r2 = text.sorted { $0 < $1 }
//            r2 = text.sorted { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
            print("\(Double(clock() - t) / Double(CLOCKS_PER_SEC))s")
            affiche_tab(Tab: r2, Nb:10)
            
        } catch let error {
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
    }
    else {
        print("Où est le fichier ?")
    }
}




