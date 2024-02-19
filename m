Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18551EA71
	for <phone-devel@vger.kernel.org>; Mon, 19 Feb 2024 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353217; cv=none; b=Pslhal0KFQ5P69bZS+B1pUAMJRAlmBOjSehtYRY1ycnNCaoNZDQWhemMY1RwS3Vn2B7mMfSeOBCo3cUoyaj2n2VpJOh+z37LaP1pJc3K0tlxbF29pzS3xbvxRM94t0p7W5iFLf77RkrX3qbQxemvRf92aCadSzpOle/3vqsBwXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353217; c=relaxed/simple;
	bh=E55A6tvppmcqo5uMegI+1QXtot00n/DsjKupvH1s+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iCYfXIQcrZVCwJ8oWOBPJJvBI/Is9NwggE5Mkni1WrBq23KPcFCBwBPzt34uUrZSAT9eYAqPh/VwIVrlmZluuProRKtLJROZxkgZObhxhwAqLAvz2gxJSq2AojoVi2pS5pYKNEnI4w891HmJ4URSAKGHXOjAgS/WVPryxPMmbN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kMFxOgcD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kMFxOgcD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33d18931a94so2064537f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 19 Feb 2024 06:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1708353213; x=1708958013; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fx0Nfh/GZY23MSwb8h36wBmZT1dZMCgZLMin+nAG92o=;
        b=kMFxOgcDn7VVwmSU/CKfaKoKmDttq4TS8V+Z96IvzPsWoQIkseDhzGWuecwlYHznop
         fW4DyLInToooK3rloOmGk6zeFPvOlsbxXKSQcPnFLqBaqZTmyWBBjmNsU7NbRQktVMQk
         aBLbQmE7545yogwlIJwNQD8ns4rhYlsiAgVKIdgtzdTfhMAyc4vWacqXWzW0nXbX6c8U
         CIMULBLqe8vlmam2JW1jVjFksP4m3oiCe6AUKHC3rxMQDUlLhHN1/7UW6SLitCAZS7Tg
         aQy3y/XMUOx+ECOtksdlnWBPX/MGCLkGi5/8LZDOcYzXF94dBAIT0KZtxPnGel5o6OHR
         Q7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353213; x=1708958013;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fx0Nfh/GZY23MSwb8h36wBmZT1dZMCgZLMin+nAG92o=;
        b=xG1TZNa1ZvmcGk8EhdyOnHcJjBXuztt3mpJSXTsQiL7O/WNMlCnnqoW3G/FhksG0bz
         6Bb0Cc+tyN7GvWapNlaTUITgsiyVgiiTUuTau4tlFj3tI/u599ty6MivFcI3O0voMnrS
         8/S1gmGaitCjpzChsmTpGU+vXg/aRNKsO8zqC9rR5Y13v7w33my0TuWseOsowDsKhwo7
         7008+uqHAMaJ+SG7BuVH7JfQxTAZOA8k8siHoPW4lrysMdmj6usVU8cz5ICss04fR0/k
         d4hjAPLcwR9UIh2mW7hRsShdDBr+5QoUAuGYsedsNU6JGcEipgJGvU4nkMXhuHvfJdWQ
         J/3g==
X-Forwarded-Encrypted: i=1; AJvYcCUHjS1k/s0sBsJT8EQ+fFWMZQ/M/PJW8d5QquyNjJKyR0VNynwgFfYScNTZEklvneH7jubej+PgLoJ0wR5VXnrhuHhBH4OY/zgJ/y4=
X-Gm-Message-State: AOJu0Yxyv/5C5C6CMBqa2IuxdJTenYiOuQl57Jj4YrdJvuwb0kCWUm/C
	pR39BH/1j8J3zAtOTErH8QR0WQivu6PP3Qr7U6oINzJr8B0hl8g6J7D1aKSKTn4T6HgeUwyVnfa
	h
X-Google-Smtp-Source: AGHT+IEpkivuVWTmGFjTymrSTRZ3SougY9X/d5AjLZRwEHWDiLLI/aGwizs1Hx3F+XGn6ThNw9s7mA==
X-Received: by 2002:a5d:4e82:0:b0:33d:1352:3dc4 with SMTP id e2-20020a5d4e82000000b0033d13523dc4mr5873325wru.38.1708353212938;
        Mon, 19 Feb 2024 06:33:32 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id o18-20020adfcf12000000b0033b87c2725csm10541866wrj.104.2024.02.19.06.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 06:33:32 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 19 Feb 2024 15:33:27 +0100
Subject: [PATCH] arm64: dts: qcom: Fix type of "wdog" IRQs for remoteprocs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-remoteproc-irqs-v1-1-c5aeb02334bd@fairphone.com>
X-B4-Tracking: v=1; b=H4sIALZm02UC/x3MQQqAIBBA0avErBN0jKCuEi3ExppFamNEEN09a
 fkW/z9QSJgKjM0DQhcXTrHCtA34zcWVFC/VgBo7jWZQQns6KUvyiuUoqrfB4mBdwF5DrbJQ4Ps
 /TvP7flEAnhphAAAA
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

The code in qcom_q6v5_init() requests the "wdog" IRQ as
IRQF_TRIGGER_RISING. If dt defines the interrupt type as LEVEL_HIGH then
the driver will have issues getting the IRQ again after probe deferral
with an error like:

  irq: type mismatch, failed to map hwirq-14 for interrupt-controller@b220000!

Fix that by updating the devicetrees to use IRQ_TYPE_EDGE_RISING for
these interrupts, as is already used in most dt's. Also the driver was
already using the interrupts with that type.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
See also this thread:
https://lore.kernel.org/linux-arm-msm/efecb4cf-e42b-40fb-aa68-37433529604b@linaro.org/
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
 arch/arm64/boot/dts/qcom/sm6350.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sm6375.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c31a09bac4ed..8379ca283d52 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3707,7 +3707,7 @@ remoteproc_adsp: remoteproc@3700000 {
 			compatible = "qcom,sc7280-adsp-pas";
 			reg = <0 0x03700000 0 0x100>;
 
-			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -3944,7 +3944,7 @@ remoteproc_cdsp: remoteproc@a300000 {
 			compatible = "qcom,sc7280-cdsp-pas";
 			reg = <0 0x0a300000 0 0x10000>;
 
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a5b194813079..c9058c7fc1a3 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2641,7 +2641,7 @@ remoteproc_adsp: remoteproc@3000000 {
 			compatible = "qcom,sc8280xp-adsp-pas";
 			reg = <0 0x03000000 0 0x100>;
 
-			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -4977,7 +4977,7 @@ remoteproc_nsp0: remoteproc@1b300000 {
 			compatible = "qcom,sc8280xp-nsp0-pas";
 			reg = <0 0x1b300000 0 0x100>;
 
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp0_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp0_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp0_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -5108,7 +5108,7 @@ remoteproc_nsp1: remoteproc@21300000 {
 			compatible = "qcom,sc8280xp-nsp1-pas";
 			reg = <0 0x21300000 0 0x100>;
 
-			interrupts-extended = <&intc GIC_SPI 887 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 887 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp1_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp1_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp1_in 2 IRQ_TYPE_EDGE_RISING>,
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 24bcec3366ef..0be053555602 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1252,7 +1252,7 @@ adsp: remoteproc@3000000 {
 			compatible = "qcom,sm6350-adsp-pas";
 			reg = <0 0x03000000 0 0x100>;
 
-			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -1511,7 +1511,7 @@ cdsp: remoteproc@8300000 {
 			compatible = "qcom,sm6350-cdsp-pas";
 			reg = <0 0x08300000 0 0x10000>;
 
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 4386f8a9c636..f40509d91bbd 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -1561,7 +1561,7 @@ remoteproc_adsp: remoteproc@a400000 {
 			compatible = "qcom,sm6375-adsp-pas";
 			reg = <0 0x0a400000 0 0x100>;
 
-			interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f3c70b87efad..03c7dda1d542 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3062,7 +3062,7 @@ slpi: remoteproc@5c00000 {
 			compatible = "qcom,sm8250-slpi-pas";
 			reg = <0 0x05c00000 0 0x4000>;
 
-			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&pdc 9 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -3766,7 +3766,7 @@ cdsp: remoteproc@8300000 {
 			compatible = "qcom,sm8250-cdsp-pas";
 			reg = <0 0x08300000 0 0x10000>;
 
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -5928,7 +5928,7 @@ adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8250-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
 
-			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,

---
base-commit: 35a4fdde2466b9d90af297f249436a270ef9d30e
change-id: 20240219-remoteproc-irqs-63f3293af260

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

