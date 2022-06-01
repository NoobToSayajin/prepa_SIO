import random
_SEED = None  #10
random.seed(_SEED, 2)


class loto:
    """
    :constructor (
        :pNMax : nombre max du 1er tirage,
        :pCMax : nombre max du 2eme tirage,
        :pTNum : combien de numero a tirer au 1er tirage,
        :pTComp : combien de numero a tirer au 2 eme tirage
        )
    """

    def __init__(self, pNMax = 50, pCMax = 12, pTNum = 5, pTComp = 2):
        self.nMax = pNMax
        self.cMax = pCMax
        self.tirageNum = pTNum
        self.tirageComp = pTComp
        self.score = 0
        self.listNum = []
        self.listComp = []
        self.rndNum = []
        self.rndComp = []

    def restart(self):
        self.listNum.clear()
        self.listComp.clear()
        self.rndNum.clear()
        self.rndComp.clear()
        self.score = 0

    def ajoutNum(self, pNombre):
        global n
        n = pNombre
        i = 0
        if 1 <= n and n <= self.nMax:
            for i in range(0, len(self.listNum)):
                if n == self.listNum[i]:
                    txt = "le numero existe deja, choisir un numéro entre 1 et " + \
                        str(self.nMax)+":\n"
                    nu = int(input(txt))
                    self.ajoutNum(nu)
                else:
                    continue
        else:
            txt = "ERREUR: numero trop grand, choisir un numéro entre 1 et " + \
                str(self.nMax)+":\n"
            n = int(input(txt))
            self.ajoutNum(n)

        return n

    def ajoutComplement(self, pNombre):
        global n
        n = pNombre
        i = 0
        if 1 <= n and n <= self.cMax:
            for i in range(0, len(self.listComp)):
                if n == self.listComp[i]:
                    txt = "le numero existe deja, choisir un numéro entre 1 et " + \
                        str(self.cMax)+":\n"
                    nu = int(input(txt))
                    self.ajoutComplement(nu)
                else:
                    continue
        else:
            txt = "ERREUR: numero trop grand, choisir un numéro entre 1 et " + \
                str(self.cMax)+":\n"
            n = int(input(txt))
            self.ajoutComplement(n)

        return n

    def ajoutRndNum(self, pNombre):
        global n
        n = pNombre
        i = 0
        for i in range(0, len(self.rndNum)):
            if pNombre == self.rndNum[i]:
                n = random.randint(1, self.nMax)
                self.ajoutRndNum(n)
            else:
                continue

        return n

    def ajoutRndComplement(self, pNombre):
        global n
        n = pNombre
        i = 0
        for i in range(0, len(self.rndComp)):
            if n == self.rndComp[i]:
                n = random.randint(1, self.cMax)
                self.ajoutRndComplement(n)
            else:
                continue

        return n

    def start(self):

        self.restart()

        i = 1
        for i in range(0, self.tirageNum):
            rnd = self.ajoutRndNum(random.randint(1, self.nMax))
            #n = self.ajoutRndNum(random.randint(1, self.nMax))
            #print(n)
            txt = "choisir un numéro entre 1 et " + str(self.nMax)+":\n"
            n = int(input(txt))
            a = self.ajoutNum(n)
            self.listNum.append(a)
            self.rndNum.append(rnd)

        i = 0
        for i in range(0, len(self.listNum)):
            j = 0
            for j in range(0, len(self.listNum)):
                if self.listNum[i] == self.rndNum[j]:
                    self.score += 1

        i = 1
        for i in range(0, self.tirageComp):
            rnd = self.ajoutRndComplement(random.randint(1, self.cMax))
            #n = self.ajoutRndComplement(random.randint(1, self.cMax))
            #print(n)
            txt = "choisir un numéro entre 1 et " + str(self.cMax)+":\n"
            n = int(input(str(txt)))
            a = self.ajoutComplement(n)
            self.listComp.append(a)
            self.rndComp.append(rnd)

        i = 0
        for i in range(0, len(self.listComp)):
            j = 0
            for j in range(0, len(self.listComp)):
                if self.listComp[i] == self.rndComp[j]:
                    self.score += 1

        print("\n"+"-"*71+"\n")
        print("Vos numéros: ", self.listNum,
              " numéro complémentaire: ", self.listComp)
        print("\n"+"-"*71+"\n")
        print("Les bons numéros: ", self.rndNum,
              " numéro complémentaire: ", self.rndComp)
        print("\n"+"-"*71+"\n")
        print("Nombre de bon numéros: ", self.score)
        print("\n"+"-"*71+"\n")
