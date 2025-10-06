-- CreateTable
CREATE TABLE "public"."Empresa" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "cnpj" TEXT,
    "email" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Empresa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Vaga" (
    "id" SERIAL NOT NULL,
    "empresaId" INTEGER NOT NULL,
    "descricao" TEXT NOT NULL,
    "escolaridade" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Vaga_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."VagaSubtipo" (
    "vagaId" INTEGER NOT NULL,
    "subtipoId" INTEGER NOT NULL,

    CONSTRAINT "VagaSubtipo_pkey" PRIMARY KEY ("vagaId","subtipoId")
);

-- CreateTable
CREATE TABLE "public"."VagaAcessibilidade" (
    "vagaId" INTEGER NOT NULL,
    "acessibilidadeId" INTEGER NOT NULL,

    CONSTRAINT "VagaAcessibilidade_pkey" PRIMARY KEY ("vagaId","acessibilidadeId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_cnpj_key" ON "public"."Empresa"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_email_key" ON "public"."Empresa"("email");

-- CreateIndex
CREATE INDEX "VagaSubtipo_subtipoId_idx" ON "public"."VagaSubtipo"("subtipoId");

-- CreateIndex
CREATE INDEX "VagaAcessibilidade_acessibilidadeId_idx" ON "public"."VagaAcessibilidade"("acessibilidadeId");

-- AddForeignKey
ALTER TABLE "public"."Vaga" ADD CONSTRAINT "Vaga_empresaId_fkey" FOREIGN KEY ("empresaId") REFERENCES "public"."Empresa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."VagaSubtipo" ADD CONSTRAINT "VagaSubtipo_vagaId_fkey" FOREIGN KEY ("vagaId") REFERENCES "public"."Vaga"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."VagaSubtipo" ADD CONSTRAINT "VagaSubtipo_subtipoId_fkey" FOREIGN KEY ("subtipoId") REFERENCES "public"."SubtipoDeficiencia"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."VagaAcessibilidade" ADD CONSTRAINT "VagaAcessibilidade_vagaId_fkey" FOREIGN KEY ("vagaId") REFERENCES "public"."Vaga"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."VagaAcessibilidade" ADD CONSTRAINT "VagaAcessibilidade_acessibilidadeId_fkey" FOREIGN KEY ("acessibilidadeId") REFERENCES "public"."Acessibilidade"("id") ON DELETE CASCADE ON UPDATE CASCADE;
