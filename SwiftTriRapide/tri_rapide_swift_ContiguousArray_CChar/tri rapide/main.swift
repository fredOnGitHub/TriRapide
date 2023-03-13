//
//  main.swift
//  tri rapide
//
//  Created by frédéric carpon on 14/05/2020.
//  Copyright © 2020 frederic carpon. All rights reserved.
//


import Foundation

var nb_swap=0

func comp(_ a:ContiguousArray<CChar>,_ b:ContiguousArray<CChar>)->Int32{
    var p = min (a.count,b.count)
    var i=0
    while (p>0 && (a[i] == b[i])){
        i+=1
        p-=1
    }
    if p != 0 {
        return Int32(a[i]) - Int32(b[i])
    }else if (a.count < b.count){
        return -1;
    }else{//a.count < b.count
        return 1;
    }
}
func ecris(_ a:String, _ b:ContiguousArray<CChar>, _ c:ContiguousArray<CChar>){
    print(a,terminator: " ")
    ps(b)
    print(" ",terminator: "")
    ps(c)
}
func quicksort_dernier_elt_3(_ A: inout ContiguousArray<ContiguousArray<CChar>>,_ lo: Int,_ hi:Int){
//    print("quickSort lo",lo,"hi",hi)
    if (lo < hi) {
        let p = partition_dernier_elt_3(&A, lo, hi)
//        print("quicksort_dernier_elt",lo,p-1,"et",p + 1, hi)
        quicksort_dernier_elt_3(&A, lo, p - 1)
        quicksort_dernier_elt_3(&A, p + 1, hi)
    }
}
func partition_dernier_elt_3(_ A: inout ContiguousArray<ContiguousArray<CChar>> ,_ lo: Int,_ hi:Int)->Int{
    let pivot = A[hi]
//    aff(A,6)
    var i = lo
    for j in lo..<hi{
//        print("j :",j,terminator: " ")
//        ecris("compare ", A[j], pivot)
        let r = comp(A[j], pivot)
//        print(" : ",r, terminator: " ")
        if r < 0{
//            ecris(" => Échanger", A[j], A[j])
            A.swapAt(i,j)
            nb_swap+=1
            i+=1
        }
//        print()
    }
//    ecris("Échanger ", A[i], A[hi]); print()
    nb_swap+=1
    A.swapAt(i,hi)
    return i;
}
let f = "nombres_aleatoires_50_000.txt"
//let f = "a.txt"
var homeDirURL = FileManager.default.homeDirectoryForCurrentUser
homeDirURL.appendPathComponent(f)
//func nl(_ s : CChar){
//    print("\(s)", terminator:" ")
//}

func ps(_ a: ContiguousArray<CChar>){
    print("\(String(bytes:a.map{ UInt8($0) }, encoding: String.Encoding.utf8)!)", terminator:" ")
}
func aff(_ a: ContiguousArray<ContiguousArray<CChar>>, _ n : Int){
    func go()->(){
        func slice()-> ArraySlice<ContiguousArray<Int8>> {
            if n < a.count {return a[0 ..< n]}
            else {return a[0 ..< a.count]}
        }
        print("[ ", terminator:"")
        slice().forEach{ ps($0) }
        if n < a.count{
            print(" ... ]")
        }else{
            print("]")
        }
    }
    go()
}

if FileManager.default.fileExists(atPath: homeDirURL.path){
    let file: FileHandle? = FileHandle(forReadingAtPath: homeDirURL.path)
    //    let sentence = "\nLine \n\n1\nLine 2\nLine 3\n"
    //    var lines = sentence.split { $0.isNewline }
    //    print(lines)   // "[Line 1, Line 2, Line 3]"
    if file != nil {
        do {
            print("MemoryLayout<CChar>.size : \(MemoryLayout<CChar>.size) bytes")
            print("MemoryLayout<CChar>.alignment : \(MemoryLayout<CChar>.alignment) bytes")
            print("MemoryLayout<CChar>.stride : \(MemoryLayout<CChar>.stride) bytes")
            var t = clock()
            let file = try String(contentsOfFile: homeDirURL.path, encoding: String.Encoding.utf8)//String
            let cs = file.cString(using : String.Encoding.utf8)!.dropLast()// ! => n'est plus Optional<Array<Int8>
//            print("cs : \(cs)")
            var u = ContiguousArray(cs.split { $0 == 10 }.map{ ContiguousArray($0) })
            var t2 = clock()
            print("Durée du chargement du tableau => \(Double(t2 - t) / Double(CLOCKS_PER_SEC)) sec")
            //            print(u)
            print("Taille du tableau :",u.count)
            aff(u,6)
            t = clock()
            quicksort_dernier_elt_3(&u,0,u.count-1)
            t2 = clock()
            print("Durée du tri => \(Double(t2 - t) / Double(CLOCKS_PER_SEC)) sec")
            aff(u,6)
            print("Nombre d'échanges : ",nb_swap)
        } catch let error {
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
    }
    else {
        print("file ?")
    }
}else{
    print("path ?")
}




